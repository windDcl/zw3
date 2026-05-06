<template>
  <div class="page result-page">
    <el-alert v-if="error" :title="error" type="error" show-icon style="margin-bottom: 12px" />
    <el-skeleton v-if="loading" :rows="8" animated />

    <section v-if="result" class="result-layout">
      <div class="panel result-main">
        <div class="section-title">
          <div>
            <h2>{{ titleText }}</h2>
            <p>{{ askedQuestion }}</p>
          </div>
        </div>

        <div v-if="result.hit && result.candidates?.length" class="result-hit-top">
          <div>
            <span>匹配问题</span>
            <strong>{{ result.candidates[0]?.matchedQuestion }}</strong>
          </div>
          <div>
            <span>相似度</span>
            <strong>{{ Number(result.similarity || 0).toFixed(4) }}</strong>
          </div>
        </div>

        <article class="answer-card">
          <h3>{{ result.answerSource === 'graph' ? '图谱回答摘要' : '标准答案' }}</h3>
          <p v-if="result.faq?.standardAnswer">{{ result.faq.standardAnswer }}</p>
          <p v-else-if="result.message">{{ result.message }}</p>
          <p v-else>暂无可展示答案</p>
        </article>

        <article v-if="result.aiAnswer" class="answer-card ai">
          <h3>AI 参考答复</h3>
          <p>{{ result.aiAnswer }}</p>
        </article>

        <article v-if="result.graph?.nodes?.length" class="answer-card graph-card">
          <div class="card-head">
            <div>
              <h3>相关事项关系图</h3>
              <p>{{ result.graph.summary || '围绕当前事项展示一跳知识图谱关系。' }}</p>
            </div>
            <el-button size="small" @click="reloadGraph">刷新图谱</el-button>
          </div>
          <KnowledgeGraphChart :graph="result.graph" @node-click="handleNodeClick" />
        </article>

        <article v-if="result.graphPath?.length" class="answer-card path-card">
          <h3>办理路径</h3>
          <div class="path-flow">
            <div v-for="step in result.graphPath" :key="`${step.step}-${step.id}`" class="path-step">
              <span>{{ step.type }}</span>
              <strong>{{ step.name }}</strong>
            </div>
          </div>
        </article>
      </div>

      <aside class="panel result-side">
        <div class="section-title">
          <div>
            <h3>图谱详情</h3>
            <p>查看节点说明、关联问答和下一步建议</p>
          </div>
        </div>

        <div class="side-card">
          <strong>{{ activeNode?.name || result.graph?.centerNode?.name || '当前事项' }}</strong>
          <p>{{ activeNode?.summary || result.graph?.centerNode?.summary || '点击图谱中的节点可查看说明。' }}</p>
        </div>

        <div v-if="activeNodeProperties.length" class="side-card">
          <strong>节点属性</strong>
          <ul class="prop-list">
            <li v-for="item in activeNodeProperties" :key="item.key">
              <span>{{ item.key }}</span>
              <em>{{ item.value }}</em>
            </li>
          </ul>
        </div>

        <div v-if="result.relatedFaqs?.length" class="side-card">
          <strong>关联问答</strong>
          <button
            v-for="item in result.relatedFaqs"
            :key="item.id"
            class="related-faq"
            @click="goAsk(item.question)"
          >
            {{ item.question }}
          </button>
        </div>

        <button class="result-action primary" @click="$router.push('/')">返回首页继续提问</button>
      </aside>
    </section>
  </div>
</template>

<script setup>
import { computed, onMounted, ref } from 'vue'
import { useRouter } from 'vue-router'
import http from '../../api/http'
import KnowledgeGraphChart from '../../components/KnowledgeGraphChart.vue'

const router = useRouter()
const result = ref(null)
const loading = ref(true)
const error = ref('')
const askedQuestion = ref('')
const activeNode = ref(null)

const titleText = computed(() => {
  if (!result.value) {
    return ''
  }
  if (result.value.hit) {
    return '已为你匹配到最相关答案'
  }
  if (result.value.answerSource === 'graph') {
    return '知识图谱为你补充了相关事项信息'
  }
  return '知识库暂未命中'
})

const activeNodeProperties = computed(() => {
  const props = activeNode.value?.properties || {}
  return Object.entries(props)
    .filter(([key, value]) => !['bizId', 'name', 'type', 'summary', 'status', 'source', 'aliases', 'createdAt', 'updatedAt'].includes(key) && value !== null && value !== '')
    .map(([key, value]) => ({
      key,
      value: Array.isArray(value) ? value.join('、') : String(value)
    }))
})

const fetchAskResult = async () => {
  const q = localStorage.getItem('last_question') || ''
  askedQuestion.value = q
  if (!q.trim()) {
    error.value = '没有获取到问题内容，请返回首页重新提问。'
    loading.value = false
    return
  }
  try {
    const resp = await http.post('/public/ask', { question: q, topN: 3 })
    result.value = resp.data.data
    activeNode.value = result.value?.graph?.centerNode || null
    if (activeNode.value?.id) {
      await loadNodeDetail(activeNode.value.id)
    }
  } catch (e) {
    error.value = e.response?.data?.message || '请求结果失败，请检查后端服务是否正常。'
  } finally {
    loading.value = false
  }
}

const loadNodeDetail = async (nodeId) => {
  try {
    const resp = await http.get(`/public/graph/node/${nodeId}`)
    if (resp.data.data) {
      activeNode.value = resp.data.data
    }
  } catch (_e) {
    // Keep the basic graph node payload if detail loading fails.
  }
}

const handleNodeClick = async (node) => {
  activeNode.value = node
  if (node?.id) {
    await loadNodeDetail(node.id)
  }
}

const reloadGraph = async () => {
  const matterId = result.value?.graph?.centerNode?.id
  if (!matterId) {
    return
  }
  const resp = await http.get(`/public/graph/matter/${matterId}`)
  if (resp.data.data) {
    result.value.graph = resp.data.data
  }
}

const goAsk = (question) => {
  localStorage.setItem('last_question', question)
  router.go(0)
}

onMounted(fetchAskResult)
</script>

<style scoped>
.result-layout {
  display: grid;
  grid-template-columns: minmax(0, 1.35fr) 360px;
  gap: 18px;
}

.result-main {
  display: flex;
  flex-direction: column;
  gap: 14px;
}

.result-hit-top {
  display: grid;
  grid-template-columns: repeat(2, minmax(0, 1fr));
  gap: 14px;
}

.result-hit-top div {
  padding: 18px;
  border-radius: 22px;
  background: linear-gradient(180deg, #ffffff, #eef8f6);
}

.result-hit-top span {
  color: var(--muted);
  font-size: 13px;
}

.result-hit-top strong {
  display: block;
  margin-top: 8px;
  font-size: 24px;
}

.answer-card {
  padding: 22px;
  border-radius: 24px;
  background: #fff;
  border: 1px solid var(--border);
}

.answer-card h3 {
  margin: 0 0 10px;
}

.answer-card p {
  margin: 0;
  line-height: 1.8;
  white-space: pre-wrap;
}

.answer-card.ai {
  background: linear-gradient(180deg, #f8fdff, #eff8ff);
}

.card-head {
  display: flex;
  justify-content: space-between;
  gap: 16px;
  align-items: flex-start;
  margin-bottom: 14px;
}

.card-head p {
  color: var(--muted);
}

.path-flow {
  display: flex;
  flex-wrap: wrap;
  gap: 12px;
}

.path-step {
  min-width: 120px;
  padding: 14px 16px;
  border-radius: 18px;
  background: linear-gradient(180deg, #f8fafc, #eef8f6);
}

.path-step span {
  display: block;
  color: var(--muted);
  font-size: 12px;
}

.path-step strong {
  display: block;
  margin-top: 6px;
}

.result-side {
  display: flex;
  flex-direction: column;
  gap: 14px;
}

.side-card {
  padding: 18px;
  border-radius: 20px;
  background: rgba(255, 255, 255, 0.9);
  border: 1px solid var(--border);
}

.side-card p {
  margin: 8px 0 0;
  color: var(--muted);
  line-height: 1.7;
}

.prop-list {
  margin: 12px 0 0;
  padding: 0;
  list-style: none;
  display: flex;
  flex-direction: column;
  gap: 10px;
}

.prop-list li {
  display: flex;
  justify-content: space-between;
  gap: 16px;
}

.prop-list span {
  color: var(--muted);
}

.prop-list em {
  color: #0f172a;
  font-style: normal;
  text-align: right;
}

.related-faq {
  width: 100%;
  margin-top: 10px;
  padding: 12px 14px;
  border: 1px solid var(--border);
  border-radius: 16px;
  background: #fff;
  cursor: pointer;
  text-align: left;
}

.result-action {
  padding: 14px 18px;
  border: 1px solid var(--border);
  border-radius: 18px;
  background: rgba(255, 255, 255, 0.9);
  cursor: pointer;
  text-align: left;
  font-weight: 700;
}

.result-action.primary {
  border: 0;
  background: linear-gradient(135deg, #0f766e, #0ea5e9);
  color: #fff;
}

@media (max-width: 768px) {
  .result-layout,
  .result-hit-top {
    grid-template-columns: 1fr;
  }

  .card-head {
    flex-direction: column;
  }
}
</style>
