package com.govqa.client;

import lombok.Data;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

@Component
@RequiredArgsConstructor
public class NlpClient {
    // NLP 客户端：调用语义匹配服务返回候选问题
    private final RestTemplate restTemplate;

    @Value("${app.nlp.base-url}")
    private String nlpBaseUrl;

    @Data
    public static class MatchItem {
        private Long faqId;
        private String matchedQuestion;
        private Double score;
    }

    public List<MatchItem> match(String question, int topN) {
        Map<String, Object> req = new HashMap<>();
        req.put("question", question);
        req.put("top_n", topN);
        ResponseEntity<Map<String, Object>> resp = restTemplate.exchange(
                nlpBaseUrl + "/match",
                HttpMethod.POST,
                new HttpEntity<>(req),
                new ParameterizedTypeReference<Map<String, Object>>() {
                }
        );
        Map<String, Object> body = resp.getBody();
        if (body == null) {
            return List.of();
        }
        Object resultsObj = body.get("results");
        if (!(resultsObj instanceof List<?> results)) {
            return List.of();
        }
        return results.stream()
                .filter(Objects::nonNull)
                .filter(item -> item instanceof Map)
                .map(item -> (Map<String, Object>) item)
                .map(m -> {
            MatchItem item = new MatchItem();
            item.setFaqId(((Number) m.get("faq_id")).longValue());
            item.setMatchedQuestion((String) m.get("matched_question"));
            item.setScore(((Number) m.get("score")).doubleValue());
            return item;
        }).toList();
    }

    public void reindex(List<Map<String, Object>> faqs) {
        Map<String, Object> req = new HashMap<>();
        req.put("faqs", faqs);
        restTemplate.postForEntity(nlpBaseUrl + "/reindex", req, Map.class);
    }
}
