package com.govqa.repository;

import com.govqa.entity.FaqAlias;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface FaqAliasRepository extends JpaRepository<FaqAlias, Long> {
    // FAQ 别名数据访问：用于语义匹配训练与检索
    List<FaqAlias> findByFaqId(Long faqId);
    void deleteByFaqId(Long faqId);
}
