<template>
  <div class="admin-page">
    <section class="panel">
      <div class="section-title">
        <div>
          <h2>FAQ 管理</h2>
          <p>维护标准问答、别名问题，并给 FAQ 绑定知识图谱事项节点。</p>
        </div>
        <el-space wrap>
          <el-button @click="loadData">刷新</el-button>
          <el-button type="primary" plain @click="reindexFaqs">重建索引</el-button>
          <el-button type="primary" @click="openCreate">新增 FAQ</el-button>
        </el-space>
      </div>

      <div class="toolbar">
        <el-input v-model="keyword" placeholder="搜索标准问题或答案" clearable />
        <el-select v-model="categoryFilter" placeholder="全部分类" clearable>
          <el-option v-for="item in categories" :key="item.id" :label="item.name" :value="item.id" />
        </el-select>
        <el-select v-model="statusFilter" placeholder="全部状态" clearable>
          <el-option label="启用" :value="1" />
          <el-option label="停用" :value="0" />
        </el-select>
      </div>

      <el-table :data="filteredRows" stripe>
        <el-table-column prop="standardQuestion" label="标准问题" min-width="260" />
        <el-table-column label="所属分类" width="140">
          <template #default="{ row }">
            {{ categoryMap[row.categoryId] || '-' }}
          </template>
        </el-table-column>
        <el-table-column label="状态" width="100">
          <template #default="{ row }">
            <el-tag :type="row.status === 1 ? 'success' : 'info'">
              {{ row.status === 1 ? '启用' : '停用' }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="updatedAt" label="更新时间" width="180" />
        <el-table-column label="操作" width="360" fixed="right">
          <template #default="{ row }">
            <el-space wrap>
              <el-button type="primary" plain @click="openEdit(row)">编辑</el-button>
              <el-button plain @click="openGraphDialog(row)">图谱绑定</el-button>
              <el-button plain @click="toggleStatus(row)">
                {{ row.status === 1 ? '停用' : '启用' }}
              </el-button>
              <el-button type="danger" plain @click="removeRow(row)">删除</el-button>
            </el-space>
          </template>
        </el-table-column>
      </el-table>
    </section>

    <el-dialog v-model="dialogVisible" :title="editingId ? '编辑 FAQ' : '新增 FAQ'" width="760px">
      <el-form label-position="top">
        <div class="grid-two">
          <el-form-item label="所属分类">
            <el-select v-model="form.categoryId" style="width: 100%">
              <el-option v-for="item in categories" :key="item.id" :label="item.name" :value="item.id" />
            </el-select>
          </el-form-item>
          <el-form-item label="状态">
            <el-switch
              v-model="statusEnabled"
              inline-prompt
              active-text="启用"
              inactive-text="停用"
            />
          </el-form-item>
        </div>
        <el-form-item label="标准问题">
          <el-input v-model="form.standardQuestion" />
        </el-form-item>
        <el-form-item label="标准答案">
          <el-input v-model="form.standardAnswer" type="textarea" :rows="7" />
        </el-form-item>
        <el-form-item label="别名问题">
          <el-input
            v-model="aliasesText"
            type="textarea"
            :rows="5"
            placeholder="每行一个别名问题"
          />
        </el-form-item>
      </el-form>
      <template #footer>
        <el-button @click="dialogVisible = false">取消</el-button>
        <el-button type="primary" @click="submitForm">保存</el-button>
      </template>
    </el-dialog>

    <el-dialog v-model="graphDialogVisible" title="FAQ 图谱绑定" width="760px">
      <div v-if="graphFaq" class="graph-dialog">
        <div class="graph-summary">
          <strong>{{ graphFaq.standardQuestion }}</strong>
          <p>将该 FAQ 绑定到图谱事项节点，问答命中后就能展示知识图谱。</p>
        </div>

        <div class="graph-search">
          <el-input
            v-model="graphKeyword"
            placeholder="搜索事项节点，例如：公积金提取"
            clearable
            @keyup.enter="searchGraphNodes"
          />
          <el-button type="primary" @click="searchGraphNodes">搜索节点</el-button>
        </div>

        <div class="graph-columns">
          <div class="graph-col">
            <h4>当前绑定</h4>
            <div v-if="graphLinks.length" class="bind-list">
              <div v-for="item in graphLinks" :key="item.id" class="bind-item">
                <div>
                  <strong>{{ item.graphNodeId }}</strong>
                  <p>{{ item.graphNodeType }} · {{ item.isPrimary === 1 ? '主绑定' : '辅助绑定' }}</p>
                </div>
                <el-button type="danger" plain size="small" @click="removeGraphLink(item)">移除</el-button>
              </div>
            </div>
            <div v-else class="empty-tip">暂未绑定图谱节点</div>
          </div>

          <div class="graph-col">
            <h4>搜索结果</h4>
            <div v-if="graphSearchRows.length" class="bind-list">
              <div v-for="item in graphSearchRows" :key="item.id" class="bind-item">
                <div>
                  <strong>{{ item.name }}</strong>
                  <p>{{ item.type }} · {{ item.summary || '暂无摘要' }}</p>
                </div>
                <el-button type="primary" size="small" @click="bindGraphNode(item)">设为主节点</el-button>
              </div>
            </div>
            <div v-else class="empty-tip">请输入关键词搜索图谱节点</div>
          </div>
        </div>
      </div>
    </el-dialog>
  </div>
</template>

<script setup>
import { computed, onMounted, reactive, ref } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import http from '../../api/http'

const rows = ref([])
const categories = ref([])
const keyword = ref('')
const categoryFilter = ref(null)
const statusFilter = ref(null)
const dialogVisible = ref(false)
const editingId = ref(null)
const aliasesText = ref('')
const graphDialogVisible = ref(false)
const graphFaq = ref(null)
const graphKeyword = ref('')
const graphLinks = ref([])
const graphSearchRows = ref([])
const form = reactive({
  categoryId: null,
  standardQuestion: '',
  standardAnswer: '',
  status: 1
})

const categoryMap = computed(() => Object.fromEntries(categories.value.map((item) => [item.id, item.name])))

const filteredRows = computed(() =>
  rows.value.filter((row) => {
    const text = `${row.standardQuestion || ''} ${row.standardAnswer || ''}`.toLowerCase()
    const keywordMatched = !keyword.value || text.includes(keyword.value.trim().toLowerCase())
    const categoryMatched = !categoryFilter.value || row.categoryId === categoryFilter.value
    const statusMatched = statusFilter.value === null || statusFilter.value === undefined || row.status === statusFilter.value
    return keywordMatched && categoryMatched && statusMatched
  })
)

const statusEnabled = computed({
  get: () => form.status === 1,
  set: (value) => {
    form.status = value ? 1 : 0
  }
})

const resetForm = () => {
  editingId.value = null
  form.categoryId = null
  form.standardQuestion = ''
  form.standardAnswer = ''
  form.status = 1
  aliasesText.value = ''
}

const loadData = async () => {
  const [faqResp, categoryResp] = await Promise.all([
    http.get('/admin/faqs'),
    http.get('/admin/categories')
  ])
  rows.value = faqResp.data.data || []
  categories.value = categoryResp.data.data || []
}

const openCreate = () => {
  resetForm()
  dialogVisible.value = true
}

const openEdit = async (row) => {
  const resp = await http.get(`/admin/faqs/${row.id}`)
  const data = resp.data.data || {}
  const faq = data.faq || row
  editingId.value = row.id
  form.categoryId = faq.categoryId
  form.standardQuestion = faq.standardQuestion
  form.standardAnswer = faq.standardAnswer
  form.status = faq.status
  aliasesText.value = (data.aliases || []).map((item) => item.aliasQuestion).join('\n')
  dialogVisible.value = true
}

const submitForm = async () => {
  const payload = {
    categoryId: form.categoryId,
    standardQuestion: form.standardQuestion,
    standardAnswer: form.standardAnswer,
    status: form.status,
    aliases: aliasesText.value
      .split('\n')
      .map((item) => item.trim())
      .filter(Boolean)
  }
  if (editingId.value) {
    await http.put(`/admin/faqs/${editingId.value}`, payload)
    ElMessage.success('FAQ 已更新')
  } else {
    await http.post('/admin/faqs', payload)
    ElMessage.success('FAQ 已创建')
  }
  dialogVisible.value = false
  resetForm()
  await loadData()
}

const toggleStatus = async (row) => {
  await http.post(`/admin/faqs/${row.id}/status`, null, {
    params: { status: row.status === 1 ? 0 : 1 }
  })
  ElMessage.success(`FAQ 已${row.status === 1 ? '停用' : '启用'}`)
  await loadData()
}

const removeRow = async (row) => {
  await ElMessageBox.confirm(`确定删除 FAQ “${row.standardQuestion}”吗？`, '删除确认', {
    type: 'warning'
  })
  await http.delete(`/admin/faqs/${row.id}`)
  ElMessage.success('FAQ 已删除')
  await loadData()
}

const reindexFaqs = async () => {
  await http.post('/admin/faqs/reindex')
  ElMessage.success('语义索引已重建')
}

const loadGraphLinks = async (faqId) => {
  const resp = await http.get(`/admin/graph/faq-links/${faqId}`)
  graphLinks.value = resp.data.data || []
}

const openGraphDialog = async (row) => {
  graphFaq.value = row
  graphKeyword.value = row.standardQuestion || ''
  graphSearchRows.value = []
  graphDialogVisible.value = true
  await loadGraphLinks(row.id)
}

const searchGraphNodes = async () => {
  if (!graphKeyword.value.trim()) {
    graphSearchRows.value = []
    return
  }
  const resp = await http.get('/admin/graph/nodes/search', {
    params: {
      keyword: graphKeyword.value,
      limit: 10,
      type: 'Matter'
    }
  })
  graphSearchRows.value = resp.data.data || []
}

const bindGraphNode = async (node) => {
  if (!graphFaq.value) {
    return
  }
  await http.post('/admin/graph/faq-links', {
    faqId: graphFaq.value.id,
    graphNodeId: node.id,
    graphNodeType: node.type,
    isPrimary: 1,
    sortOrder: 0
  })
  ElMessage.success('图谱节点已绑定')
  await loadGraphLinks(graphFaq.value.id)
}

const removeGraphLink = async (item) => {
  await http.delete(`/admin/graph/faq-links/${item.id}`)
  ElMessage.success('绑定已移除')
  if (graphFaq.value) {
    await loadGraphLinks(graphFaq.value.id)
  }
}

onMounted(loadData)
</script>

<style scoped>
.admin-page {
  display: flex;
  flex-direction: column;
  gap: 18px;
}

.toolbar {
  display: grid;
  grid-template-columns: minmax(0, 1fr) 180px 160px;
  gap: 12px;
  margin-bottom: 16px;
}

.graph-dialog {
  display: flex;
  flex-direction: column;
  gap: 16px;
}

.graph-summary p {
  margin: 8px 0 0;
  color: var(--muted);
}

.graph-search {
  display: grid;
  grid-template-columns: minmax(0, 1fr) 120px;
  gap: 12px;
}

.graph-columns {
  display: grid;
  grid-template-columns: repeat(2, minmax(0, 1fr));
  gap: 16px;
}

.graph-col {
  min-height: 280px;
  padding: 18px;
  border-radius: 20px;
  background: rgba(248, 250, 252, 0.9);
  border: 1px solid var(--border);
}

.graph-col h4 {
  margin: 0 0 12px;
}

.bind-list {
  display: flex;
  flex-direction: column;
  gap: 12px;
}

.bind-item {
  display: flex;
  justify-content: space-between;
  gap: 12px;
  padding: 14px;
  border-radius: 16px;
  background: #fff;
  border: 1px solid var(--border);
}

.bind-item p {
  margin: 6px 0 0;
  color: var(--muted);
  line-height: 1.6;
}

@media (max-width: 768px) {
  .toolbar,
  .graph-search,
  .graph-columns {
    grid-template-columns: 1fr;
  }
}
</style>
