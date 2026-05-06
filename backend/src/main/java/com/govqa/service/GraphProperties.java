package com.govqa.service;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Data
@Component
@ConfigurationProperties(prefix = "app.graph")
public class GraphProperties {
    private boolean enabled;
    private String uri = "bolt://localhost:7687";
    private String username = "neo4j";
    private String password = "12345678";
    private String database = "neo4j";
    private int maxNeighbors = 10;
}
