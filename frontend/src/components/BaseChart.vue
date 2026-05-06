<template>
  <div ref="chartRef" :style="{ width: '100%', height }"></div>
</template>

<script setup>
import * as echarts from 'echarts'
import { nextTick, onBeforeUnmount, onMounted, ref, watch } from 'vue'

const props = defineProps({
  option: {
    type: Object,
    required: true
  },
  height: {
    type: String,
    default: '320px'
  }
})

const chartRef = ref(null)
let chartInstance = null

const renderChart = async () => {
  // 等待容器渲染完成后再初始化/更新图表实例
  await nextTick()
  if (!chartRef.value) {
    return
  }
  if (!chartInstance) {
    chartInstance = echarts.init(chartRef.value)
  }
  chartInstance.setOption(props.option, true)
  chartInstance.resize()
}

const handleResize = () => {
  if (chartInstance) {
    chartInstance.resize()
  }
}

onMounted(() => {
  renderChart()
  window.addEventListener('resize', handleResize)
})

watch(
  () => props.option,
  () => {
    renderChart()
  },
  { deep: true }
)

onBeforeUnmount(() => {
  // 页面离开时释放图表实例，避免内存泄漏
  window.removeEventListener('resize', handleResize)
  if (chartInstance) {
    chartInstance.dispose()
    chartInstance = null
  }
})
</script>
