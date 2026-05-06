package com.govqa.service;

import lombok.RequiredArgsConstructor;
import org.springframework.boot.CommandLineRunner;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class KnowledgeGraphSchemaInitializer implements CommandLineRunner {
    private final JdbcTemplate jdbcTemplate;

    @Override
    public void run(String... args) {
        jdbcTemplate.execute("""
                CREATE TABLE IF NOT EXISTS faq_graph_link (
                  id BIGINT PRIMARY KEY AUTO_INCREMENT,
                  faq_id BIGINT NOT NULL,
                  graph_node_id VARCHAR(64) NOT NULL,
                  graph_node_type VARCHAR(32) NOT NULL,
                  is_primary TINYINT NOT NULL DEFAULT 1,
                  sort_order INT NOT NULL DEFAULT 0,
                  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                  updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                  KEY idx_faq_graph_link_faq_id (faq_id),
                  KEY idx_faq_graph_link_graph_node_id (graph_node_id)
                )
                """);
    }
}
