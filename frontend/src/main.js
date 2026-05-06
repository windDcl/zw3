import { createApp } from 'vue'
import { createPinia } from 'pinia'
import ElementPlus from 'element-plus'
import 'element-plus/dist/index.css'
import App from './App.vue'
import router from './router'
import './styles/base.css'

// 应用启动入口：挂载 Pinia、路由和 Element Plus
createApp(App).use(createPinia()).use(router).use(ElementPlus).mount('#app')
