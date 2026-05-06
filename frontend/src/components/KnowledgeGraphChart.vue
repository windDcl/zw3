<template>
  <div ref="chartRef" class="graph-chart"></div>
</template>

<script setup>
import * as echarts from 'echarts'
import { computed, nextTick, onBeforeUnmount, onMounted, ref, watch } from 'vue'

const props = defineProps({
  graph: {
    type: Object,
    default: null
  },
  height: {
    type: String,
    default: '360px'
  }
})

const emit = defineEmits(['node-click'])

const chartRef = ref(null)
let chart = null

const typeColorMap = {
  Matter: '#0f766e',
  Material: '#2563eb',
  Condition: '#ea580c',
  Channel: '#16a34a',
  Department: '#334155',
  Policy: '#64748b',
  Outcome: '#ca8a04'
}

const chartOption = computed(() => {
  const graph = props.graph || {}
  const centerId = graph.centerNode?.id
  const nodes = (graph.nodes || []).map((node) => ({
    id: node.id,
    name: node.name,
    value: node.name,
    category: node.type || 'Other',
    symbolSize: node.id === centerId ? 68 : 44,
    itemStyle: {
      color: typeColorMap[node.type] || '#0ea5e9'
    },
    raw: node
  }))
  const links = (graph.edges || []).map((edge) => ({
    source: edge.source,
    target: edge.target,
    value: edge.label,
    label: {
      show: true,
      formatter: edge.label,
      color: '#64748b',
      fontSize: 11
    },
    lineStyle: {
      color: '#cbd5e1',
      width: 1.6
    }
  }))
  const categories = [...new Set(nodes.map((node) => node.category))].map((name) => ({ name }))

  return {
    tooltip: {
      trigger: 'item'
    },
    animationDuration: 600,
    legend: {
      bottom: 0,
      icon: 'circle'
    },
    series: [
      {
        type: 'graph',
        layout: 'force',
        roam: true,
        draggable: true,
        force: {
          repulsion: 320,
          edgeLength: [90, 140]
        },
        label: {
          show: true,
          position: 'bottom',
          color: '#0f172a',
          fontSize: 12
        },
        emphasis: {
          focus: 'adjacency'
        },
        categories,
        data: nodes,
        links
      }
    ]
  }
})

const renderChart = async () => {
  await nextTick()
  if (!chartRef.value) {
    return
  }
  chartRef.value.style.height = props.height
  if (!chart) {
    chart = echarts.init(chartRef.value)
    chart.on('click', (params) => {
      if (params?.data?.raw) {
        emit('node-click', params.data.raw)
      }
    })
  }
  chart.setOption(chartOption.value, true)
  chart.resize()
}

const handleResize = () => {
  if (chart) {
    chart.resize()
  }
}

onMounted(() => {
  renderChart()
  window.addEventListener('resize', handleResize)
})

watch(
  () => props.graph,
  () => {
    renderChart()
  },
  { deep: true }
)

onBeforeUnmount(() => {
  window.removeEventListener('resize', handleResize)
  if (chart) {
    chart.dispose()
    chart = null
  }
})
</script>

<style scoped>
.graph-chart {
  width: 100%;
  min-height: 320px;
}
</style>
