package com.govqa.dto;

import lombok.Data;

import java.util.LinkedHashMap;
import java.util.Map;

@Data
public class GraphNodeDto {
    private String id;
    private String name;
    private String type;
    private String summary;
    private Map<String, Object> properties = new LinkedHashMap<>();
}
