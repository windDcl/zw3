package com.govqa.entity;

import jakarta.persistence.*;
import lombok.Data;

import java.time.LocalDateTime;

@Data
@Entity
@Table(name = "faq_graph_link")
public class FaqGraphLink {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "faq_id")
    private Long faqId;

    @Column(name = "graph_node_id")
    private String graphNodeId;

    @Column(name = "graph_node_type")
    private String graphNodeType;

    @Column(name = "is_primary")
    private Integer isPrimary;

    @Column(name = "sort_order")
    private Integer sortOrder;

    @Column(name = "created_at", insertable = false, updatable = false)
    private LocalDateTime createdAt;

    @Column(name = "updated_at", insertable = false, updatable = false)
    private LocalDateTime updatedAt;
}
