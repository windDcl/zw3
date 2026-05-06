<template>
  <div class="dashboard-page">
    <section class="panel">
      <div class="section-title">
        <div>
          <h2>运营总览</h2>
          <p>追踪问答服务质量、热点需求和知识库补录机会</p>
        </div>
      </div>

      <div class="stat-grid">
        <article class="stat-card">
          <span>FAQ 总数</span>
          <strong>{{ overview.faqCount || 0 }}</strong>
        </article>
        <article class="stat-card">
          <span>分类总数</span>
          <strong>{{ overview.categoryCount || 0 }}</strong>
        </article>
        <article class="stat-card">
          <span>今日提问</span>
          <strong>{{ overview.todayQuestions || 0 }}</strong>
        </article>
        <article class="stat-card">
          <span>未命中问题</span>
          <strong>{{ overview.unmatchedCount || 0 }}</strong>
        </article>
      </div>
    </section>

    <section class="grid-two">
      <div class="panel">
        <div class="section-title">
          <div>
            <h3>提问趋势</h3>
            <p>按天观察问答访问波动</p>
          </div>
        </div>
        <BaseChart :option="trendOption" />
      </div>

      <div class="panel">
        <div class="section-title">
          <div>
            <h3>分类分布</h3>
            <p>高频分类有助于优化知识库建设重点</p>
          </div>
        </div>
        <BaseChart :option="categoryOption" />
      </div>
    </section>

    <section class="panel">
      <div class="section-title">
        <div>
          <h3>热门问题排行</h3>
          <p>优先关注高频问题与长期未命中场景</p>
        </div>
      </div>
      <BaseChart :option="hotOption" height="360px" />
    </section>
  </div>
</template>

<script setup>
import { computed, onMounted, ref } from 'vue'
import http from '../../api/http'
import BaseChart from '../../components/BaseChart.vue'

const overview = ref({})
const trend = ref([])
const categoryDistribution = ref([])
const hotQuestions = ref([])

const trendOption = computed(() => ({
  // 问答趋势折线图配置
  tooltip: { trigger: 'axis' },
  grid: { left: 36, right: 16, top: 20, bottom: 30 },
  xAxis: {
    type: 'category',
    data: trend.value.map((item) => item.day)
  },
  yAxis: { type: 'value' },
  series: [
    {
      data: trend.value.map((item) => Number(item.cnt || 0)),
      type: 'line',
      smooth: true,
      areaStyle: { color: 'rgba(15,118,110,0.12)' },
      lineStyle: { color: '#0f766e', width: 3 },
      itemStyle: { color: '#0f766e' }
    }
  ]
}))

const categoryOption = computed(() => ({
  // 分类分布柱状图配置
  tooltip: { trigger: 'axis' },
  grid: { left: 36, right: 16, top: 20, bottom: 30 },
  xAxis: {
    type: 'category',
    data: categoryDistribution.value.map((item) => item.category)
  },
  yAxis: { type: 'value' },
  series: [
    {
      data: categoryDistribution.value.map((item) => Number(item.cnt || 0)),
      type: 'bar',
      barWidth: 34,
      itemStyle: {
        borderRadius: [10, 10, 0, 0],
        color: '#0ea5e9'
      }
    }
  ]
}))

const hotOption = computed(() => ({
  // 热门问题排行横向柱状图配置
  tooltip: { trigger: 'axis', axisPointer: { type: 'shadow' } },
  grid: { left: 120, right: 16, top: 10, bottom: 10 },
  xAxis: { type: 'value' },
  yAxis: {
    type: 'category',
    data: hotQuestions.value.map((item) => item.question).reverse()
  },
  series: [
    {
      data: hotQuestions.value.map((item) => Number(item.cnt || 0)).reverse(),
      type: 'bar',
      barWidth: 24,
      itemStyle: {
        borderRadius: [0, 12, 12, 0],
        color: '#0f4c5c'
      }
    }
  ]
}))

onMounted(async () => {
  // 并行请求总览和图表数据，减少后台首页加载耗时
  const [o, t, c, h] = await Promise.all([
    http.get('/admin/dashboard/overview'),
    http.get('/admin/dashboard/trend'),
    http.get('/admin/dashboard/category-distribution'),
    http.get('/admin/dashboard/hot-questions')
  ])
  overview.value = o.data.data || {}
  trend.value = t.data.data || []
  categoryDistribution.value = c.data.data || []
  hotQuestions.value = h.data.data || []
})
</script>

<style scoped>
.dashboard-page {
  display: flex;
  flex-direction: column;
  gap: 18px;
}
</style>
