-- 知识图谱 FAQ 挂接表升级脚本
-- 执行时间：2026-05-07
-- 说明：创建 faq_graph_link 表（如不存在），用于 FAQ 与图谱节点的绑定关系

CREATE TABLE IF NOT EXISTS faq_graph_link (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  faq_id BIGINT NOT NULL COMMENT 'FAQ主键',
  graph_node_id VARCHAR(64) NOT NULL COMMENT '图谱节点ID',
  graph_node_type VARCHAR(32) NOT NULL COMMENT '节点类型，通常为Matter',
  is_primary TINYINT NOT NULL DEFAULT 1 COMMENT '是否主绑定',
  sort_order INT NOT NULL DEFAULT 0 COMMENT '展示顺序',
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY idx_faq_graph_link_faq_id (faq_id),
  KEY idx_faq_graph_link_graph_node_id (graph_node_id)
) COMMENT='FAQ与知识图谱节点挂接表';
