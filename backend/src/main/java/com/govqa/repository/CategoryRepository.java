package com.govqa.repository;

import com.govqa.entity.Category;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface CategoryRepository extends JpaRepository<Category, Long> {
    // 分类数据访问：提供按状态与名称查询能力
    Optional<Category> findByName(String name);
    List<Category> findByStatusOrderBySortOrderAsc(Integer status);
}
