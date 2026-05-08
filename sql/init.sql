-- 政务问答系统初始化脚本
-- 说明：为 docker-compose 首次启动提供最小可运行 MySQL 结构与演示数据
-- 注意：本文件应以 UTF-8 编码保存；手工导入时请使用 mysql --default-character-set=utf8mb4

SET NAMES utf8mb4;

CREATE DATABASE IF NOT EXISTS gov_qa DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE gov_qa;

CREATE TABLE IF NOT EXISTS category (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  sort_order INT NOT NULL DEFAULT 0,
  status TINYINT NOT NULL DEFAULT 1,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='FAQ分类';

CREATE TABLE IF NOT EXISTS faq (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  category_id BIGINT NULL,
  standard_question VARCHAR(255) NOT NULL,
  standard_answer TEXT NOT NULL,
  status TINYINT NOT NULL DEFAULT 1,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY idx_faq_category_id (category_id),
  KEY idx_faq_status (status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='标准FAQ';

CREATE TABLE IF NOT EXISTS faq_alias (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  faq_id BIGINT NOT NULL,
  alias_question VARCHAR(255) NOT NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY idx_faq_alias_faq_id (faq_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='FAQ别名问题';

CREATE TABLE IF NOT EXISTS announcement (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(255) NOT NULL,
  content TEXT NOT NULL,
  publish_time DATETIME NULL,
  is_top TINYINT NOT NULL DEFAULT 0,
  status TINYINT NOT NULL DEFAULT 1,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY idx_announcement_status (status),
  KEY idx_announcement_publish_time (publish_time)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='公告';

CREATE TABLE IF NOT EXISTS qa_log (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  user_question VARCHAR(500) NOT NULL,
  matched_question VARCHAR(500) NULL,
  matched_faq_id BIGINT NULL,
  similarity DECIMAL(10,6) NULL,
  is_hit TINYINT NOT NULL DEFAULT 0,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY idx_qa_log_hit_created (is_hit, created_at),
  KEY idx_qa_log_faq_id (matched_faq_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='问答日志';

CREATE TABLE IF NOT EXISTS unmatched_question (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  user_question VARCHAR(500) NOT NULL,
  similarity DECIMAL(10,6) NULL,
  status TINYINT NOT NULL DEFAULT 0,
  ai_suggested_question VARCHAR(500) NULL,
  ai_suggested_answer TEXT NULL,
  ai_suggested_aliases TEXT NULL,
  ai_suggested_category VARCHAR(100) NULL,
  resolved_faq_id BIGINT NULL,
  resolved_at DATETIME NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY idx_unmatched_status_created (status, created_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='未命中问题';

CREATE TABLE IF NOT EXISTS admin (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  username VARCHAR(64) NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  status TINYINT NOT NULL DEFAULT 1,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY uk_admin_username (username)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='管理员';

CREATE TABLE IF NOT EXISTS system_setting (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  setting_key VARCHAR(100) NOT NULL,
  setting_value TEXT NULL,
  updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY uk_system_setting_key (setting_key)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统设置';

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='FAQ与知识图谱节点挂接表';

INSERT INTO category (id, name, sort_order, status)
VALUES
  (1, '社会保障', 1, 1),
  (2, '公积金', 2, 1),
  (3, '卫健服务', 3, 1),
  (4, '民政服务', 4, 1)
ON DUPLICATE KEY UPDATE
  name = VALUES(name),
  sort_order = VALUES(sort_order),
  status = VALUES(status);

INSERT INTO faq (id, category_id, standard_question, standard_answer, status)
VALUES
  (1, 2, '公积金如何提取？', '常见情形包括购房、租房、退休、非本市户籍离职等。可通过政务服务网、公积金APP或线下大厅申请，通常需身份证、公积金联名卡及对应用途材料。', 1),
  (2, 1, '社保卡怎么办理？', '首次申领社保卡通常需要本人身份证件，可通过线上渠道提交申请，也可到政务服务大厅或合作银行办理。', 1),
  (3, 3, '生育津贴怎么申请？', '生育津贴一般由参保单位或个人按当地政策申请，常需身份证、出生医学证明及参保信息，审核通过后发放。', 1),
  (4, 4, '居住证怎么办理？', '非本市户籍人员可按当地政策申请居住证，常见材料包括身份证、居住证明、就业或居住相关材料。', 1)
ON DUPLICATE KEY UPDATE
  category_id = VALUES(category_id),
  standard_question = VALUES(standard_question),
  standard_answer = VALUES(standard_answer),
  status = VALUES(status);

INSERT INTO faq_alias (faq_id, alias_question)
SELECT 1, '公积金怎么提取'
WHERE NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = 1 AND alias_question = '公积金怎么提取');
INSERT INTO faq_alias (faq_id, alias_question)
SELECT 1, '取公积金需要什么材料'
WHERE NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = 1 AND alias_question = '取公积金需要什么材料');
INSERT INTO faq_alias (faq_id, alias_question)
SELECT 2, '社保卡申领'
WHERE NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = 2 AND alias_question = '社保卡申领');
INSERT INTO faq_alias (faq_id, alias_question)
SELECT 3, '生育津贴申领'
WHERE NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = 3 AND alias_question = '生育津贴申领');
INSERT INTO faq_alias (faq_id, alias_question)
SELECT 4, '办居住证'
WHERE NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = 4 AND alias_question = '办居住证');

INSERT INTO announcement (id, title, content, publish_time, is_top, status)
VALUES
  (1, '系统初始化完成', '当前为演示初始化数据，可在后台继续维护 FAQ、图谱绑定与公告内容。', NOW(), 1, 1)
ON DUPLICATE KEY UPDATE
  title = VALUES(title),
  content = VALUES(content),
  publish_time = VALUES(publish_time),
  is_top = VALUES(is_top),
  status = VALUES(status);

INSERT INTO admin (id, username, password_hash, status)
VALUES
  (1, 'admin', '$2b$12$JTRJfql9b8YiQAWpLnFsVuCHNSPH59lUkOc1KB9wNGWlPn6b0p67.', 1)
ON DUPLICATE KEY UPDATE
  username = VALUES(username),
  password_hash = VALUES(password_hash),
  status = VALUES(status);

INSERT INTO system_setting (setting_key, setting_value)
VALUES
  ('semantic.threshold', '0.30'),
  ('ai.enabled', 'false'),
  ('ai.base-url', ''),
  ('ai.api-key', ''),
  ('ai.model', ''),
  ('ai.system-prompt', '你是一个谨慎、可靠的政务知识助手。')
ON DUPLICATE KEY UPDATE
  setting_value = VALUES(setting_value);

-- 默认后台账号：admin
-- 默认后台密码：admin123456
