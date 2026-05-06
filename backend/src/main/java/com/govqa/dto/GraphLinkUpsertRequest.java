package com.govqa.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

@Data
public class GraphLinkUpsertRequest {
    @NotNull
    private Long faqId;

    @NotBlank
    private String graphNodeId;

    @NotBlank
    private String graphNodeType;

    private Integer isPrimary = 1;
    private Integer sortOrder = 0;
}
