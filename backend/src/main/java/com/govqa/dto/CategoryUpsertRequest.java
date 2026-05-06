package com.govqa.dto;

import jakarta.validation.constraints.NotBlank;
import lombok.Data;

@Data
public class CategoryUpsertRequest {
    // 分类新增/编辑请求体
    @NotBlank
    private String name;
    private Integer sortOrder = 0;
    private Integer status = 1;
}
