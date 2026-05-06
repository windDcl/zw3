package com.govqa.service;

import com.govqa.common.BizException;
import com.govqa.dto.GraphLinkUpsertRequest;
import com.govqa.entity.Faq;
import com.govqa.entity.FaqGraphLink;
import com.govqa.repository.FaqGraphLinkRepository;
import com.govqa.repository.FaqRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

@Service
@RequiredArgsConstructor
public class KnowledgeGraphLinkService {
    private final FaqGraphLinkRepository faqGraphLinkRepository;
    private final FaqRepository faqRepository;

    public List<FaqGraphLink> listByFaqId(Long faqId) {
        return faqGraphLinkRepository.findByFaqIdOrderByIsPrimaryDescSortOrderAscIdAsc(faqId);
    }

    public Optional<FaqGraphLink> findPrimaryLink(Long faqId) {
        return faqGraphLinkRepository.findFirstByFaqIdAndIsPrimaryOrderBySortOrderAscIdAsc(faqId, 1);
    }

    public List<Map<String, Object>> relatedFaqs(String graphNodeId, Long excludeFaqId, int limit) {
        if (graphNodeId == null || graphNodeId.isBlank()) {
            return List.of();
        }
        List<FaqGraphLink> links = faqGraphLinkRepository.findByGraphNodeIdOrderBySortOrderAscIdAsc(graphNodeId);
        List<Map<String, Object>> items = new ArrayList<>();
        Set<Long> seen = new HashSet<>();
        for (FaqGraphLink link : links) {
            Long faqId = link.getFaqId();
            if (faqId == null || Objects.equals(faqId, excludeFaqId) || !seen.add(faqId)) {
                continue;
            }
            faqRepository.findById(faqId).ifPresent(faq -> {
                Map<String, Object> item = new LinkedHashMap<>();
                item.put("id", faq.getId());
                item.put("question", faq.getStandardQuestion());
                items.add(item);
            });
            if (items.size() >= limit) {
                break;
            }
        }
        return items;
    }

    @Transactional
    public FaqGraphLink saveLink(GraphLinkUpsertRequest request) {
        Faq faq = faqRepository.findById(request.getFaqId()).orElseThrow(() -> new BizException("FAQ 不存在"));
        faq.getId();
        if (request.getIsPrimary() != null && request.getIsPrimary() == 1) {
            List<FaqGraphLink> existing = faqGraphLinkRepository.findByFaqIdOrderByIsPrimaryDescSortOrderAscIdAsc(request.getFaqId());
            for (FaqGraphLink item : existing) {
                if (item.getIsPrimary() != null && item.getIsPrimary() == 1) {
                    item.setIsPrimary(0);
                }
            }
            faqGraphLinkRepository.saveAll(existing);
        }

        List<FaqGraphLink> existingLinks = faqGraphLinkRepository.findByFaqIdOrderByIsPrimaryDescSortOrderAscIdAsc(request.getFaqId());
        for (FaqGraphLink item : existingLinks) {
            if (Objects.equals(item.getGraphNodeId(), request.getGraphNodeId())) {
                item.setGraphNodeType(request.getGraphNodeType());
                item.setIsPrimary(request.getIsPrimary());
                item.setSortOrder(request.getSortOrder());
                return faqGraphLinkRepository.save(item);
            }
        }

        FaqGraphLink link = new FaqGraphLink();
        link.setFaqId(request.getFaqId());
        link.setGraphNodeId(request.getGraphNodeId());
        link.setGraphNodeType(request.getGraphNodeType());
        link.setIsPrimary(request.getIsPrimary());
        link.setSortOrder(request.getSortOrder());
        return faqGraphLinkRepository.save(link);
    }

    @Transactional
    public void deleteLink(Long id) {
        faqGraphLinkRepository.deleteById(id);
    }
}
