package com.govqa.service;

import com.govqa.dto.GraphEdgeDto;
import com.govqa.dto.GraphNodeDto;
import com.govqa.dto.GraphPathStepDto;
import com.govqa.dto.GraphViewDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.neo4j.driver.Driver;
import org.neo4j.driver.Record;
import org.neo4j.driver.Result;
import org.neo4j.driver.Session;
import org.neo4j.driver.SessionConfig;
import org.neo4j.driver.Value;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Optional;

@Slf4j
@Service
@RequiredArgsConstructor
public class KnowledgeGraphService {
    private final Optional<Driver> neo4jDriver;
    private final GraphProperties graphProperties;

    public Optional<GraphViewDto> getMatterGraph(String matterId) {
        if (!graphProperties.isEnabled() || neo4jDriver.isEmpty() || matterId == null || matterId.isBlank()) {
            return Optional.empty();
        }
        try (Session session = newSession()) {
            Result result = session.run("""
                    MATCH (m {bizId: $matterId})-[r]->(n)
                    WHERE coalesce(r.status, 1) = 1 AND coalesce(n.status, 1) = 1
                    RETURN properties(m) AS centerProps,
                           labels(m) AS centerLabels,
                           properties(n) AS nodeProps,
                           labels(n) AS nodeLabels,
                           properties(r) AS edgeProps,
                           type(r) AS relationType
                    ORDER BY coalesce(r.sortOrder, 0), coalesce(n.name, '')
                    LIMIT $limit
                    """, Map.of("matterId", matterId, "limit", graphProperties.getMaxNeighbors()));
            List<Record> records = result.list();
            if (records.isEmpty()) {
                return Optional.empty();
            }

            GraphViewDto view = new GraphViewDto();
            Record first = records.get(0);
            GraphNodeDto centerNode = toNode(first.get("centerProps"), first.get("centerLabels"));
            view.setCenterNode(centerNode);

            LinkedHashMap<String, GraphNodeDto> nodes = new LinkedHashMap<>();
            nodes.put(centerNode.getId(), centerNode);
            LinkedHashMap<String, GraphEdgeDto> edges = new LinkedHashMap<>();

            for (Record record : records) {
                GraphNodeDto node = toNode(record.get("nodeProps"), record.get("nodeLabels"));
                GraphEdgeDto edge = toEdge(centerNode.getId(), node.getId(), record.get("edgeProps"), record.get("relationType"));
                nodes.putIfAbsent(node.getId(), node);
                edges.putIfAbsent(edge.getId(), edge);
            }
            view.setNodes(new ArrayList<>(nodes.values()));
            view.setEdges(new ArrayList<>(edges.values()));
            view.setSummary(buildSummary(view));
            return Optional.of(view);
        } catch (Exception ex) {
            log.warn("Load graph failed for matterId={}", matterId, ex);
            return Optional.empty();
        }
    }

    public Optional<GraphNodeDto> getNode(String nodeId) {
        if (!graphProperties.isEnabled() || neo4jDriver.isEmpty() || nodeId == null || nodeId.isBlank()) {
            return Optional.empty();
        }
        try (Session session = newSession()) {
            Result result = session.run("""
                    MATCH (n {bizId: $nodeId})
                    WHERE coalesce(n.status, 1) = 1
                    RETURN properties(n) AS nodeProps, labels(n) AS nodeLabels
                    LIMIT 1
                    """, Map.of("nodeId", nodeId));
            if (!result.hasNext()) {
                return Optional.empty();
            }
            Record record = result.next();
            return Optional.of(toNode(record.get("nodeProps"), record.get("nodeLabels")));
        } catch (Exception ex) {
            log.warn("Load node failed for nodeId={}", nodeId, ex);
            return Optional.empty();
        }
    }

    public List<GraphNodeDto> searchNodes(String keyword, int limit, String preferredType) {
        if (!graphProperties.isEnabled() || neo4jDriver.isEmpty()) {
            return List.of();
        }
        String normalized = keyword == null ? "" : keyword.trim();
        if (normalized.isBlank()) {
            return List.of();
        }
        String labelClause = preferredType == null || preferredType.isBlank() ? "" : ":" + preferredType;
        String cypher = """
                MATCH (n%s)
                WHERE coalesce(n.status, 1) = 1
                  AND (
                    n.name CONTAINS $keyword
                    OR ANY(alias IN coalesce(n.aliases, []) WHERE alias CONTAINS $keyword)
                  )
                RETURN properties(n) AS nodeProps, labels(n) AS nodeLabels
                ORDER BY size(coalesce(n.aliases, [])) DESC, coalesce(n.name, '')
                LIMIT $limit
                """.formatted(labelClause);
        try (Session session = newSession()) {
            Result result = session.run(cypher, Map.of("keyword", normalized, "limit", Math.max(1, limit)));
            List<GraphNodeDto> nodes = new ArrayList<>();
            while (result.hasNext()) {
                Record record = result.next();
                nodes.add(toNode(record.get("nodeProps"), record.get("nodeLabels")));
            }
            return nodes;
        } catch (Exception ex) {
            log.warn("Search graph nodes failed for keyword={}", normalized, ex);
            return List.of();
        }
    }

    public List<GraphPathStepDto> findPath(String fromId, String toId) {
        if (!graphProperties.isEnabled() || neo4jDriver.isEmpty()
                || fromId == null || fromId.isBlank() || toId == null || toId.isBlank()) {
            return List.of();
        }
        try (Session session = newSession()) {
            Result result = session.run("""
                    MATCH p = shortestPath((a {bizId: $fromId})-[*..4]->(b {bizId: $toId}))
                    RETURN [n IN nodes(p) | properties(n)] AS nodePropsList,
                           [n IN nodes(p) | labels(n)] AS nodeLabelsList
                    LIMIT 1
                    """, Map.of("fromId", fromId, "toId", toId));
            if (!result.hasNext()) {
                return List.of();
            }
            Record record = result.next();
            List<Object> nodePropsList = record.get("nodePropsList").asObject() instanceof List
                    ? (List<Object>) record.get("nodePropsList").asObject() : List.of();
            List<Object> nodeLabelsList = record.get("nodeLabelsList").asObject() instanceof List
                    ? (List<Object>) record.get("nodeLabelsList").asObject() : List.of();
            List<GraphPathStepDto> steps = new ArrayList<>();
            for (int i = 0; i < nodePropsList.size(); i++) {
                @SuppressWarnings("unchecked")
                Map<String, Object> props = (Map<String, Object>) nodePropsList.get(i);
                @SuppressWarnings("unchecked")
                List<Object> labels = (List<Object>) nodeLabelsList.get(i);
                GraphNodeDto node = new GraphNodeDto();
                node.setId(asString(props.get("bizId")));
                node.setName(asString(props.get("name")));
                node.setType(asString(props.getOrDefault("type", labels.isEmpty() ? "" : labels.get(0))));
                steps.add(toPathStep(i + 1, node));
            }
            return steps;
        } catch (Exception ex) {
            log.warn("Find path failed: fromId={}, toId={}", fromId, toId, ex);
            return List.of();
        }
    }

    public List<GraphPathStepDto> buildPath(GraphViewDto view) {
        if (view == null || view.getCenterNode() == null) {
            return List.of();
        }
        List<GraphPathStepDto> steps = new ArrayList<>();
        steps.add(toPathStep(1, view.getCenterNode()));
        for (String type : List.of("Condition", "Material", "Channel", "Outcome")) {
            view.getNodes().stream()
                    .filter(node -> !Objects.equals(node.getId(), view.getCenterNode().getId()))
                    .filter(node -> type.equalsIgnoreCase(node.getType()))
                    .findFirst()
                    .ifPresent(node -> steps.add(toPathStep(steps.size() + 1, node)));
        }
        return steps;
    }

    private Session newSession() {
        SessionConfig config = SessionConfig.builder().withDatabase(graphProperties.getDatabase()).build();
        return neo4jDriver.orElseThrow().session(config);
    }

    private GraphNodeDto toNode(Value propsValue, Value labelsValue) {
        Map<String, Object> properties = propsValue.asMap(KnowledgeGraphService::toObject);
        List<Object> labels = labelsValue.asList(KnowledgeGraphService::toObject);
        GraphNodeDto node = new GraphNodeDto();
        node.setId(asString(properties.get("bizId")));
        node.setName(asString(properties.get("name")));
        node.setType(asString(properties.getOrDefault("type", labels.isEmpty() ? "" : labels.get(0))));
        node.setSummary(asString(properties.get("summary")));
        node.setProperties(new LinkedHashMap<>(properties));
        return node;
    }

    private GraphEdgeDto toEdge(String sourceId, String targetId, Value propsValue, Value relationTypeValue) {
        Map<String, Object> properties = propsValue.asMap(KnowledgeGraphService::toObject);
        String relationType = relationTypeValue.asString("");
        GraphEdgeDto edge = new GraphEdgeDto();
        edge.setId(asString(properties.getOrDefault("bizId", sourceId + "_" + relationType + "_" + targetId)));
        edge.setSource(sourceId);
        edge.setTarget(targetId);
        edge.setRelationType(relationType);
        edge.setLabel(asString(properties.getOrDefault("label", relationType)));
        return edge;
    }

    private GraphPathStepDto toPathStep(int step, GraphNodeDto node) {
        GraphPathStepDto dto = new GraphPathStepDto();
        dto.setStep(step);
        dto.setId(node.getId());
        dto.setName(node.getName());
        dto.setType(node.getType());
        return dto;
    }

    private String buildSummary(GraphViewDto view) {
        if (view.getCenterNode() == null) {
            return "";
        }
        Map<String, Long> counts = new LinkedHashMap<>();
        for (GraphNodeDto node : view.getNodes()) {
            if (Objects.equals(node.getId(), view.getCenterNode().getId())) {
                continue;
            }
            counts.merge(node.getType(), 1L, Long::sum);
        }
        if (counts.isEmpty()) {
            return view.getCenterNode().getSummary() == null ? "" : view.getCenterNode().getSummary();
        }
        StringBuilder builder = new StringBuilder();
        builder.append(view.getCenterNode().getName()).append("关联了");
        boolean first = true;
        for (Map.Entry<String, Long> entry : counts.entrySet()) {
            if (!first) {
                builder.append("、");
            }
            first = false;
            builder.append(entry.getValue()).append("个").append(entry.getKey());
        }
        builder.append("节点。");
        return builder.toString();
    }

    private static Object toObject(Value value) {
        if (value == null || value.isNull()) {
            return null;
        }
        return value.asObject();
    }

    private String asString(Object value) {
        return value == null ? "" : String.valueOf(value);
    }
}
