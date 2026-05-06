# 政务问答系统知识图谱落地方案

## 1. 目标

在现有“FAQ 语义匹配 + AI 兜底”的政务问答系统上，新增知识图谱能力，实现以下目标：

1. 在问答结果页展示事项相关的材料、条件、渠道、部门、政策、结果等关系。
2. 在 FAQ 命中时返回图谱增强信息，在 FAQ 未命中时支持图谱型查询与回答。
3. 在后台提供图谱管理能力，支持节点、关系、FAQ 挂接与图谱可视化维护。
4. 为后续多跳查询、路径推荐、地区化差异解释和图谱驱动追问预留扩展空间。

## 2. 现状与改造原则

### 2.1 当前系统现状

- 前端：`Vue 3 + Element Plus + ECharts`
- 后端：`Spring Boot + JPA + MySQL`
- NLP：独立 `nlp-service`，负责 FAQ 语义匹配与索引重建
- 问答入口：`POST /api/public/ask`
- 核心编排：`backend/src/main/java/com/govqa/service/AskService.java`
- FAQ 维护：`backend/src/main/java/com/govqa/service/FaqService.java`
- 前台结果页：`frontend/src/pages/public/PublicResult.vue`
- 后台 FAQ 页：`frontend/src/pages/admin/AdminFaq.vue`

### 2.2 改造原则

1. 保留现有 FAQ 问答主链路，不推翻原系统。
2. 图谱能力作为增强层接入，不直接替代 FAQ。
3. 问答入口仍由后端统一编排，前端不直接拼接多个服务结果。
4. FAQ、日志、设置等业务数据继续保留在 MySQL。
5. 图谱实体与关系存入图数据库，优先支持一跳关系展示与路径解释。

## 3. 总体方案

### 3.1 推荐架构

- `MySQL`
  - 存储 FAQ、分类、公告、日志、未命中问题、系统设置
- `Neo4j`
  - 存储知识图谱节点、关系、FAQ 与图谱节点的挂接关系
- `Spring Boot Backend`
  - 作为统一业务编排层
- `nlp-service`
  - 负责 FAQ 语义召回
- `Frontend`
  - 展示标准答案、图谱关系图、办理路径、节点详情

### 3.2 推荐查询链路

1. 用户通过 `/api/public/ask` 提问。
2. 后端先调用 `nlp-service` 做 FAQ TopN 语义召回。
3. 若 FAQ 高置信命中：
   - 返回 FAQ 标准答案
   - 根据 FAQ 绑定的主事项节点查询图谱增强信息
4. 若 FAQ 未命中但识别出图谱核心事项：
   - 走图谱检索与关系聚合
   - 返回图谱型答案
5. 若 FAQ 与图谱均不足以给出稳定答案：
   - 调用现有 `AiAssistService` 做参考回答

### 3.3 为什么选择 Neo4j

本项目第一阶段推荐使用 `Neo4j`，理由如下：

1. 接入 Spring Boot 成本低，适合现有技术栈。
2. `Cypher` 查询对一跳、多跳、路径查询友好。
3. 对当前政务知识图谱规模足够，开发和调试效率高。
4. 后续若需要更大规模或特定国产化要求，再评估 `NebulaGraph`。

## 4. 图谱数据建模

### 4.1 节点类型

建议节点以政务问答场景为核心，而不是过度学术化建模。

| 类型 | 标签 | 说明 | 示例 |
| --- | --- | --- | --- |
| 事项 | `Matter` | 用户最常问的办理事项 | 社保转移、公积金提取 |
| 材料 | `Material` | 办理所需材料 | 身份证、参保证明 |
| 条件 | `Condition` | 办理前置条件 | 连续缴纳满 6 个月 |
| 渠道 | `Channel` | 办理渠道 | 线下大厅、政务服务网 |
| 部门 | `Department` | 办理部门 | 公积金中心、人社局 |
| 政策 | `Policy` | 政策依据 | 某实施细则、通知 |
| 人群 | `PersonType` | 适用对象 | 灵活就业人员、企业职工 |
| 地区 | `Region` | 地区范围 | 市级、区县级 |
| 结果 | `Outcome` | 办理结果 | 转移完成、提取到账 |
| FAQ 主题 | `FaqTopic` | FAQ 的图谱入口主题，可选 | 公积金提取问答 |

### 4.2 节点公共属性

所有节点建议统一保留以下基础属性：

| 字段 | 类型 | 说明 |
| --- | --- | --- |
| `id` | string | 图数据库内部或业务唯一标识 |
| `name` | string | 展示名称 |
| `type` | string | 节点类型 |
| `summary` | string | 简短说明 |
| `status` | int | 1 启用，0 停用 |
| `source` | string | 数据来源 |
| `regionCode` | string | 地区编码，可空 |
| `createdAt` | datetime | 创建时间 |
| `updatedAt` | datetime | 更新时间 |

节点类型专属属性可按需扩展，例如：

- `Matter`
  - `matterCode`
  - `serviceMode`
  - `timeLimit`
- `Policy`
  - `policyNo`
  - `publishOrg`
  - `effectiveDate`
- `Channel`
  - `channelType`
  - `onlineUrl`
  - `address`

### 4.3 关系类型

建议优先定义稳定、面向业务解释的关系。

| 关系 | 起点 | 终点 | 含义 |
| --- | --- | --- | --- |
| `REQUIRES_MATERIAL` | `Matter` | `Material` | 事项需要材料 |
| `HAS_CONDITION` | `Matter` | `Condition` | 事项具备前置条件 |
| `HANDLED_BY` | `Matter` | `Department` | 事项由某部门办理 |
| `AVAILABLE_AT` | `Matter` | `Channel` | 事项可通过某渠道办理 |
| `APPLIES_TO` | `Matter` | `PersonType` | 事项适用于某类人群 |
| `BASED_ON` | `Matter` | `Policy` | 事项依据某政策 |
| `RESULTS_IN` | `Matter` | `Outcome` | 事项办理结果 |
| `BELONGS_TO_REGION` | 任意 | `Region` | 实体适用地区 |
| `RELATED_TO` | 任意 | 任意 | 通用关联关系 |
| `FAQ_MAPPED_TO` | `FaqTopic` | `Matter` | FAQ 主题映射到事项 |

关系建议保留属性：

| 字段 | 类型 | 说明 |
| --- | --- | --- |
| `id` | string | 关系唯一标识 |
| `relationType` | string | 关系类型 |
| `label` | string | 前端展示文字，如“需要”“办理于” |
| `sortOrder` | int | 前端展示顺序 |
| `status` | int | 1 启用，0 停用 |
| `source` | string | 来源 |
| `createdAt` | datetime | 创建时间 |
| `updatedAt` | datetime | 更新时间 |

### 4.4 FAQ 与图谱的挂接策略

FAQ 仍然是当前系统的主入口，因此必须建立 FAQ 与图谱的稳定映射。

建议增加一张 MySQL 业务挂接表：

`faq_graph_link`

| 字段 | 类型 | 说明 |
| --- | --- | --- |
| `id` | bigint | 主键 |
| `faq_id` | bigint | FAQ 主键 |
| `graph_node_id` | varchar | 图谱节点 ID |
| `graph_node_type` | varchar | 节点类型，通常为 `Matter` |
| `is_primary` | tinyint | 是否主绑定 |
| `sort_order` | int | 展示顺序 |
| `created_at` | datetime | 创建时间 |
| `updated_at` | datetime | 更新时间 |

建议规则：

1. 每条 FAQ 至少允许绑定 1 个主事项节点。
2. 可选绑定多个辅助节点，用于展示更多关系。
3. FAQ 命中后优先使用主事项节点作为图谱中心节点。

## 5. 后端落地方案

### 5.1 模块拆分

建议在 `backend` 新增以下模块：

- `entity`
  - `FaqGraphLink.java`
- `repository`
  - `FaqGraphLinkRepository.java`
- `service`
  - `KnowledgeGraphService.java`
  - `KnowledgeGraphLinkService.java`
  - `KnowledgeGraphQueryService.java`
- `controller`
  - `PublicGraphController.java`
  - `AdminKnowledgeGraphController.java`
- `client`
  - `GraphClient.java` 或直接使用 Neo4j 驱动适配层
- `dto`
  - `GraphNodeDto.java`
  - `GraphEdgeDto.java`
  - `GraphViewDto.java`
  - `GraphPathDto.java`

### 5.2 AskService 改造建议

`AskService` 仍是总编排入口，建议改为：

1. `FAQ 命中分支`
   - 返回 `faq`
   - 查询 FAQ 绑定的图谱中心节点
   - 组装一跳图谱视图
   - 返回办理路径与关联 FAQ

2. `图谱回答分支`
   - 对问题做事项识别或关键词映射
   - 命中事项节点时返回图谱摘要与图谱视图

3. `AI 兜底分支`
   - 保留现有 `AiAssistService`
   - 在提示词中可增加“若已识别到图谱事项，则参考图谱上下文回答”

### 5.3 推荐返回结构

`POST /api/public/ask`

```json
{
  "code": 0,
  "message": "success",
  "data": {
    "hit": true,
    "answerSource": "faq",
    "threshold": 0.75,
    "similarity": 0.91,
    "faq": {
      "id": 12,
      "categoryId": 2,
      "standardQuestion": "公积金如何提取",
      "standardAnswer": "..."
    },
    "graph": {
      "centerNode": {
        "id": "matter_1001",
        "name": "公积金提取",
        "type": "Matter",
        "summary": "住房公积金提取办理事项"
      },
      "nodes": [
        {
          "id": "matter_1001",
          "name": "公积金提取",
          "type": "Matter"
        },
        {
          "id": "material_2001",
          "name": "身份证",
          "type": "Material"
        }
      ],
      "edges": [
        {
          "id": "edge_1",
          "source": "matter_1001",
          "target": "material_2001",
          "relationType": "REQUIRES_MATERIAL",
          "label": "需要"
        }
      ],
      "summary": "该事项通常需要身份证、申请表，并可通过政务大厅或线上渠道办理。"
    },
    "graphPath": [
      {
        "step": 1,
        "type": "Matter",
        "name": "公积金提取"
      },
      {
        "step": 2,
        "type": "Condition",
        "name": "满足提取条件"
      },
      {
        "step": 3,
        "type": "Material",
        "name": "身份证"
      }
    ],
    "relatedFaqs": [
      {
        "id": 13,
        "question": "公积金提取多久到账"
      }
    ],
    "candidates": []
  }
}
```

### 5.4 前台图谱相关接口

建议新增：

- `GET /api/public/graph/matter/{id}`
  - 获取事项一跳图谱
- `GET /api/public/graph/node/{id}`
  - 获取节点详情
- `GET /api/public/graph/path?from={id}&to={id}`
  - 获取两个节点之间的路径
- `GET /api/public/graph/related-faqs/{nodeId}`
  - 获取节点关联 FAQ

### 5.5 后台图谱管理接口

建议新增：

- `GET /api/admin/graph/overview`
- `GET /api/admin/graph/nodes`
- `POST /api/admin/graph/nodes`
- `PUT /api/admin/graph/nodes/{id}`
- `DELETE /api/admin/graph/nodes/{id}`
- `GET /api/admin/graph/relations`
- `POST /api/admin/graph/relations`
- `PUT /api/admin/graph/relations/{id}`
- `DELETE /api/admin/graph/relations/{id}`
- `GET /api/admin/graph/faq-links/{faqId}`
- `POST /api/admin/graph/faq-links`
- `DELETE /api/admin/graph/faq-links/{id}`
- `GET /api/admin/graph/canvas/{nodeId}`

## 6. 前端界面设计

### 6.1 前台结果页改造

改造页面：

- `frontend/src/pages/public/PublicResult.vue`

建议结果页分为 4 个区域：

1. `主答案卡`
   - FAQ 标准答案或 AI 参考答案
   - 保留当前结果页主结构

2. `关系图谱卡`
   - 标题：`相关事项关系图`
   - 中心节点：事项
   - 一跳节点：材料、条件、渠道、部门、政策、结果
   - 点击节点显示详情

3. `办理路径卡`
   - 用线性步骤展示：
   - `事项 -> 条件 -> 材料 -> 渠道 -> 结果`

4. `关联问答卡`
   - 展示同一事项下的 FAQ 扩展问题

推荐布局：

- 左侧主栏
  - 主答案卡
  - 关系图谱卡
  - 办理路径卡
- 右侧边栏
  - 节点详情卡
  - 政策依据卡
  - 关联 FAQ 卡

### 6.2 前台可视化实现方式

项目已包含：

- `echarts`
- 通用图表组件 `frontend/src/components/BaseChart.vue`

因此第一阶段直接使用 `ECharts graph` 实现图谱视图。

建议节点样式：

- `Matter`
  - 主色：青绿色
  - 节点尺寸最大
- `Material`
  - 蓝色
- `Condition`
  - 橙色
- `Channel`
  - 绿色
- `Department`
  - 深青灰
- `Policy`
  - 中性色
- `Outcome`
  - 金色

建议交互规则：

1. 默认只展开一跳，节点数控制在 6 到 10 个。
2. 点击节点，右侧显示详情。
3. 支持“展开更多”加载二跳关系。
4. 支持“围绕该节点继续提问”。

### 6.3 后台页面设计

新增后台菜单：`知识图谱`

建议新增页面：

1. `图谱概览`
   - 节点总数
   - 关系总数
   - 事项数
   - 孤立节点数
   - FAQ 挂接率

2. `节点管理`
   - 表格管理节点
   - 支持按类型、状态、地区筛选

3. `关系管理`
   - 管理起点、终点、关系类型、标签

4. `FAQ 挂接`
   - 为 FAQ 绑定主事项节点和辅助节点

5. `图谱画布`
   - 左侧搜索
   - 中间图谱
   - 右侧属性编辑
   - 支持新建节点、创建关系、删除关系、预览前台效果

## 7. 开发实施计划

### 7.1 第一阶段：最小可交付版本

目标：让用户在结果页真正看到图谱。

范围：

1. 引入 `Neo4j`
2. 完成节点、关系、FAQ 挂接模型
3. 新增图谱查询服务
4. 改造 `AskService`
5. 改造 `PublicResult.vue`
6. 展示一跳图谱和办理路径

产出：

- 用户提问后可以看到标准答案
- 命中 FAQ 时可以看到事项关系图
- 管理员可以通过最简方式维护 FAQ 与事项绑定

### 7.2 第二阶段：后台管理完善

范围：

1. 图谱概览页
2. 节点管理页
3. 关系管理页
4. FAQ 挂接管理页
5. 图谱画布预览

产出：

- 管理员可独立维护图谱
- 图谱不再依赖手工脚本导入

### 7.3 第三阶段：增强能力

范围：

1. 二跳扩展
2. 路径推荐
3. 地区化差异问答
4. 基于图谱的追问推荐
5. 图谱与 AI 联合回答

产出：

- 从“图谱展示”升级为“图谱驱动问答”

## 8. 风险与注意事项

1. 不建议第一阶段就把所有政务知识都做成图谱，优先覆盖高频事项。
2. 图谱节点名称必须规范，否则 FAQ 挂接与可视化会混乱。
3. 一跳关系优先级要可配置，避免前台图过于拥挤。
4. 政策信息具有时效性，`Policy` 节点需保留生效时间和来源。
5. 地区差异较大时，不应只靠图谱静态关系，仍需结合地区上下文和人工审核。

## 9. 最终结论

本项目知识图谱最合适的落地方式是：

1. 保留现有 FAQ 问答主链路。
2. 新增 `Neo4j` 作为图谱存储。
3. 在 `AskService` 接入图谱增强问答。
4. 在 `PublicResult.vue` 展示图谱关系、办理路径和节点详情。
5. 新增后台知识图谱管理模块，支持节点、关系和 FAQ 挂接。
6. 第一阶段优先实现“问答命中后可视化展示图谱”，第二阶段再完善图谱后台管理。

这套方案既能适配当前项目结构，也能满足后续图数据库和图谱型问答的扩展需求。
