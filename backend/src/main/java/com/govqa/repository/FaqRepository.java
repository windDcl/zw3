package com.govqa.repository;

import com.govqa.entity.Faq;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface FaqRepository extends JpaRepository<Faq, Long> {
    // FAQ 数据访问：分类查询、关键字检索、统计等
    long countByCategoryId(Long categoryId);
    List<Faq> findByStatus(Integer status);
    List<Faq> findByCategoryIdAndStatus(Long categoryId, Integer status);
}
