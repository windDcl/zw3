package com.govqa.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Data
public class UnmatchedResolveRequest {
    // 未命中问题处理请求：关联 FAQ 与处理备注
    @NotNull
    private Long categoryId;
    @NotBlank
    private String standardQuestion;
    @NotBlank
    private String standardAnswer;
    private Integer status = 1;
    private List<String> aliases = new ArrayList<>();
}
