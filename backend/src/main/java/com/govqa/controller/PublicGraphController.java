package com.govqa.controller;

import com.govqa.common.ApiResponse;
import com.govqa.dto.GraphNodeDto;
import com.govqa.dto.GraphViewDto;
import com.govqa.service.KnowledgeGraphLinkService;
import com.govqa.service.KnowledgeGraphService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/public/graph")
@RequiredArgsConstructor
public class PublicGraphController {
    private final KnowledgeGraphService knowledgeGraphService;
    private final KnowledgeGraphLinkService knowledgeGraphLinkService;

    @GetMapping("/matter/{id}")
    public ApiResponse<GraphViewDto> matter(@PathVariable("id") String id) {
        return ApiResponse.ok(knowledgeGraphService.getMatterGraph(id).orElse(null));
    }

    @GetMapping("/node/{id}")
    public ApiResponse<GraphNodeDto> node(@PathVariable("id") String id) {
        return ApiResponse.ok(knowledgeGraphService.getNode(id).orElse(null));
    }

    @GetMapping("/related-faqs/{nodeId}")
    public ApiResponse<List<Map<String, Object>>> relatedFaqs(@PathVariable("nodeId") String nodeId,
                                                              @RequestParam(value = "limit", defaultValue = "6") Integer limit) {
        return ApiResponse.ok(knowledgeGraphLinkService.relatedFaqs(nodeId, null, limit));
    }
}
