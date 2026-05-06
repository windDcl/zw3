import axios from 'axios'

// 开发环境默认走 /api，由 Vite 代理转发到后端服务
const baseURL = import.meta.env.VITE_API_BASE_URL || '/api'

const http = axios.create({
  baseURL,
  timeout: 30000
})

http.interceptors.request.use((config) => {
  // 管理端接口统一携带本地 token，后端拦截器据此鉴权
  const token = localStorage.getItem('admin_token')
  if (token) {
    config.headers.Authorization = token
  }
  return config
})

export default http
