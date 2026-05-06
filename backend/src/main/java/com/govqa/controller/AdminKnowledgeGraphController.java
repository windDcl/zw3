package com.govqa.controller;

import com.govqa.common.ApiResponse;
import com.govqa.dto.GraphLinkUpsertRequest;
import com.govqa.dto.GraphNodeDto;
import com.govqa.entity.FaqGraphLink;
import com.govqa.service.KnowledgeGraphLinkService;
import com.govqa.service.KnowledgeGraphService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/admin/graph")
@RequiredArgsConstructor
public class AdminKnowledgeGraphController {
    private final KnowledgeGraphLinkService knowledgeGraphLinkService;
    private final KnowledgeGraphService knowledgeGraphService;

    @GetMapping("/faq-links/{faqId}")
    public ApiResponse<List<FaqGraphLink>> faqLinks(@PathVariable("faqId") Long faqId) {
        return ApiResponse.ok(knowledgeGraphLinkService.listByFaqId(faqId));
    }

    @PostMapping("/faq-links")
    public ApiResponse<FaqGraphLink> saveFaqLink(@Valid @RequestBody GraphLinkUpsertRequest request) {
        return ApiResponse.ok(knowledgeGraphLinkService.saveLink(request));
    }

    @DeleteMapping("/faq-links/{id}")
    public ApiResponse<Void> deleteFaqLink(@PathVariable("id") Long id) {
        knowledgeGraphLinkService.deleteLink(id);
        return ApiResponse.ok(null);
    }

    @GetMapping("/nodes/search")
    public ApiResponse<List<GraphNodeDto>> searchNodes(@RequestParam("keyword") String keyword,
                                                       @RequestParam(value = "limit", defaultValue = "10") Integer limit,
                                                       @RequestParam(value = "type", required = false) String type) {
        return ApiResponse.ok(knowledgeGraphService.searchNodes(keyword, limit, type));
    }
}
