package com.govqa.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.Size;
import lombok.Data;

@Data
public class AskRequest {
    // 市民提问请求参数：问题文本与候选数
    @NotBlank
    @Size(max = 200)
    private String question;
    @Min(1)
    @Max(10)
    private Integer topN = 3;
}
