package com.govqa.dto;

import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Data
public class GraphViewDto {
    private GraphNodeDto centerNode;
    private List<GraphNodeDto> nodes = new ArrayList<>();
    private List<GraphEdgeDto> edges = new ArrayList<>();
    private String summary;
}
