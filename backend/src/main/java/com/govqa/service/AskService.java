package com.govqa.service;

import com.govqa.client.NlpClient;
import com.govqa.dto.GraphViewDto;
import com.govqa.entity.Faq;
import com.govqa.entity.QaLog;
import com.govqa.entity.UnmatchedQuestion;
import com.govqa.repository.FaqRepository;
import com.govqa.repository.QaLogRepository;
import com.govqa.repository.UnmatchedQuestionRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class AskService {
    private final NlpClient nlpClient;
    private final FaqRepository faqRepository;
    private final QaLogRepository qaLogRepository;
    private final UnmatchedQuestionRepository unmatchedQuestionRepository;
    private final SettingService settingService;
    private final AiAssistService aiAssistService;
    private final KnowledgeGraphService knowledgeGraphService;
    private final KnowledgeGraphLinkService knowledgeGraphLinkService;

    public Map<String, Object> ask(String question, int topN) {
        List<NlpClient.MatchItem> matches = nlpClient.match(question, topN);
        double threshold = settingService.threshold();
        NlpClient.MatchItem top = matches.isEmpty() ? null : matches.get(0);
        Faq topFaq = top == null ? null : faqRepository.findById(top.getFaqId()).orElse(null);
        boolean hit = top != null && top.getScore() >= threshold && topFaq != null;

        Map<String, Object> result = new HashMap<>();
        result.put("hit", hit);
        result.put("threshold", threshold);
        result.put("candidates", matches);

        if (hit) {
            result.put("faq", topFaq);
            result.put("similarity", top.getScore());
            result.put("answerSource", "faq");
            attachGraphByFaq(result, topFaq.getId());
            writeLog(question, top.getMatchedQuestion(), topFaq.getId(), top.getScore(), 1);
            return result;
        }

        boolean graphAnswered = attachGraphByQuestion(result, question);
        if (graphAnswered) {
            result.put("answerSource", "graph");
            result.put("message", "知识库未直接命中，以下为根据知识图谱整理的关联事项信息。");
        } else {
            Optional<String> aiAnswer = aiAssistService.answerPublicQuestion(question);
            result.put("answerSource", "ai");
            result.put("message", aiAnswer.isPresent()
                    ? "知识库和图谱均未直接命中，以下为第三方 AI 生成的参考答复，请以官方最新信息为准。"
                    : "未找到相关问题，建议咨询政务服务大厅或拨打 12345 热线");
            aiAnswer.ifPresent(answer -> result.put("aiAnswer", answer));
        }

        writeLog(question, top == null ? null : top.getMatchedQuestion(),
                topFaq == null ? null : topFaq.getId(), top == null ? null : top.getScore(), 0);
        writeUnmatched(question, top == null ? null : top.getScore());
        return result;
    }

    private void attachGraphByFaq(Map<String, Object> result, Long faqId) {
        knowledgeGraphLinkService.findPrimaryLink(faqId)
                .flatMap(link -> knowledgeGraphService.getMatterGraph(link.getGraphNodeId()))
                .ifPresent(graph -> attachGraphPayload(result, graph, faqId));
    }

    private boolean attachGraphByQuestion(Map<String, Object> result, String question) {
        return knowledgeGraphService.searchNodes(question, 1, "Matter").stream()
                .findFirst()
                .flatMap(node -> knowledgeGraphService.getMatterGraph(node.getId()))
                .map(graph -> {
                    attachGraphPayload(result, graph, null);
                    return true;
                })
                .orElse(false);
    }

    private void attachGraphPayload(Map<String, Object> result, GraphViewDto graph, Long faqId) {
        result.put("graph", graph);
        result.put("graphPath", knowledgeGraphService.buildPath(graph));
        String centerNodeId = graph.getCenterNode() == null ? null : graph.getCenterNode().getId();
        result.put("relatedFaqs", knowledgeGraphLinkService.relatedFaqs(centerNodeId, faqId, 6));
    }

    private void writeLog(String userQuestion, String matchedQuestion, Long faqId, Double similarity, int hit) {
        QaLog log = new QaLog();
        log.setUserQuestion(userQuestion);
        log.setMatchedQuestion(matchedQuestion);
        log.setMatchedFaqId(faqId);
        log.setSimilarity(similarity == null ? null : BigDecimal.valueOf(similarity));
        log.setIsHit(hit);
        qaLogRepository.save(log);
    }

    private void writeUnmatched(String question, Double similarity) {
        UnmatchedQuestion q = new UnmatchedQuestion();
        q.setUserQuestion(question);
        q.setSimilarity(similarity == null ? null : BigDecimal.valueOf(similarity));
        q.setStatus(0);
        unmatchedQuestionRepository.save(q);
    }
}
