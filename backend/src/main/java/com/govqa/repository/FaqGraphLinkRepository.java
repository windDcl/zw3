package com.govqa.repository;

import com.govqa.entity.FaqGraphLink;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface FaqGraphLinkRepository extends JpaRepository<FaqGraphLink, Long> {
    List<FaqGraphLink> findByFaqIdOrderByIsPrimaryDescSortOrderAscIdAsc(Long faqId);
    List<FaqGraphLink> findByGraphNodeIdOrderBySortOrderAscIdAsc(String graphNodeId);
    Optional<FaqGraphLink> findFirstByFaqIdAndIsPrimaryOrderBySortOrderAscIdAsc(Long faqId, Integer isPrimary);
    void deleteByFaqIdAndGraphNodeId(Long faqId, String graphNodeId);
}
