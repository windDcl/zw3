<template>
  <div>
    <h2>FAQ Excel 导入</h2>
    <p>模板文件：docs/templates/faq-import-template.csv</p>
    <el-upload :http-request="upload" accept=".xlsx,.xls" :show-file-list="false">
      <el-button type="primary">上传并导入</el-button>
    </el-upload>
    <el-card v-if="result" style="margin-top:12px">
      <pre>{{ result }}</pre>
    </el-card>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import http from '../../api/http'

const result = ref(null)

const upload = async ({ file }) => {
  // 组装 multipart/form-data 上传 Excel，交由后端批量导入 FAQ
  const form = new FormData()
  form.append('file', file)
  form.append('categoryId', 1)
  const resp = await http.post('/admin/import/faq-excel', form)
  result.value = resp.data.data
}
</script>
