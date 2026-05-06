package com.govqa.dto;

import lombok.Data;

@Data
public class GraphEdgeDto {
    private String id;
    private String source;
    private String target;
    private String relationType;
    private String label;
}
