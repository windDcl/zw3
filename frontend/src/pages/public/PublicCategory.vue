<template>
  <div class="page category-page">
    <section class="panel category-hero">
      <div>
        <span class="hero-eyebrow">分类服务</span>
        <h1>在同一主题下，快速找到稳定答案</h1>
        <p>适合办理流程、材料清单、咨询入口这类高频问题。</p>
      </div>
      <div class="category-search">
        <el-input v-model="keyword" placeholder="分类内搜索，例如：提取、转移、参保" @keyup.enter="loadFaqs" />
        <el-button type="primary" @click="loadFaqs">搜索</el-button>
      </div>
    </section>

    <section class="faq-list">
      <article v-for="faq in faqs" :key="faq.id" class="panel faq-card">
        <div>
          <strong>{{ faq.standardQuestion }}</strong>
          <p>{{ faq.standardAnswer }}</p>
        </div>
        <el-button @click="viewAnswer(faq.standardQuestion)">查看答案</el-button>
      </article>
      <div v-if="!faqs.length" class="panel empty-tip">当前分类下暂无匹配问答</div>
    </section>
  </div>
</template>

<script setup>
import { onMounted, ref } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import http from '../../api/http'

const route = useRoute()
const router = useRouter()
const keyword = ref('')
const faqs = ref([])
// 与首页一致：统一规则识别要隐藏的测试分类
const isHiddenCategory = (name) =>
  String(name || '').trim().normalize('NFKC').toLowerCase() === '测试分类a'

const loadFaqs = async () => {
  // 按当前分类 ID 拉取问答，可带关键字筛选
  const resp = await http.get(`/public/categories/${route.params.id}/faqs`, {
    params: { keyword: keyword.value }
  })
  faqs.value = resp.data.data || []
}

const viewAnswer = (question) => {
  // 复用结果页能力，写入问题后直接跳转
  localStorage.setItem('last_question', question)
  router.push('/result')
}

onMounted(async () => {
  // 先校验当前分类是否需要隐藏，命中则直接返回首页
  const categoryResp = await http.get('/public/categories')
  const categories = categoryResp.data.data || []
  const current = categories.find((item) => String(item.id) === String(route.params.id))
  if (current && isHiddenCategory(current.name)) {
    router.replace('/')
    return
  }
  await loadFaqs()
})
</script>

<style scoped>
.category-page {
  display: flex;
  flex-direction: column;
  gap: 18px;
}

.category-hero {
  display: grid;
  grid-template-columns: minmax(0, 1fr) 420px;
  gap: 20px;
  align-items: end;
}

.category-hero h1 {
  margin: 12px 0 10px;
  font-size: 40px;
}

.category-hero p {
  margin: 0;
  color: var(--muted);
}

.category-search {
  display: grid;
  grid-template-columns: minmax(0, 1fr) 108px;
  gap: 10px;
}

.faq-list {
  display: flex;
  flex-direction: column;
  gap: 14px;
}

.faq-card {
  display: grid;
  grid-template-columns: minmax(0, 1fr) 120px;
  gap: 16px;
  align-items: center;
}

.faq-card strong {
  font-size: 22px;
}

.faq-card p {
  margin: 10px 0 0;
  color: var(--muted);
  line-height: 1.8;
}

@media (max-width: 768px) {
  .category-hero,
  .category-search,
  .faq-card {
    grid-template-columns: 1fr;
  }

  .category-hero h1 {
    font-size: 30px;
  }
}
</style>
