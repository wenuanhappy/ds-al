# 数据结构可视化平台 - 前端开发文档

## 一、项目概述

### 1.1 项目定位
数据结构可视化平台是一款基于 Web 技术的综合性学习工具，旨在通过交互式可视化、结构化课程体系、社交协作功能及 AI 智能辅助，将抽象的数据结构与算法知识转化为直观易懂的学习体验，助力用户高效掌握相关技能。平台已从单一算法演示工具升级为"学习 + 社交 + 智能辅助"三位一体的综合性学习平台。

### 1.2 核心价值
- **可视化呈现**：将复杂算法（如树旋转、排序过程、图遍历）动态演示，降低理解门槛
- **协作学习生态**：通过好友系统、评论互动，构建用户间交流探讨的学习社区
- **高效学习路径**：结构化课程分类与个性化练习模式，适配不同学习进度需求
- **智能辅助支持**：多模型 AI 导师（GPT-4V / Coze）提供精准答疑，覆盖文本、图片等多模态交互场景

---

## 二、技术栈详解

### 2.1 核心技术栈

| 技术类别 | 具体选型 | 版本 | 应用说明 |
|---------|----------|------|----------|
| 前端框架 | Vue 3 (Composition API) | ^3.2.47 | 采用组合式 API 提升代码复用性与逻辑组织效率 |
| 构建工具 | Vite | ^4.0.0 | 实现快速热更新、高效打包，支持精细化分包与懒加载 |
| UI 组件库 | Element Plus | ^2.4.3 | 提供统一视觉风格与成熟交互组件 |
| UI 组件库 | View UI Plus | ^1.3.10 | 提供表单、卡片、通知等高级组件 |
| 路由管理 | Vue Router | ^4.1.6 | 实现路由懒加载、导航守卫 |
| 状态管理 | Pinia | ^2.0.32 | 轻量级状态管理方案 |
| HTTP 客户端 | Axios | ^1.6.2 | 统一封装接口请求 |
| Markdown 编辑器 | v-md-editor | ^2.2.4 | 支持 Markdown 渲染与 KaTeX 数学公式 |
| 样式框架 | TailwindCSS | ^3.3.2 | 原子化 CSS 框架 |
| 图标资源 | Element Plus Icons / Icon Park | - | 提供丰富图标支持 |

### 2.2 技术架构优势
- **高性能**：Vue 3 双向绑定优化与 Vite 构建提速，配合多级优化策略，首屏加载时间显著缩短
- **高可维护性**：模块化目录结构、组件化开发模式，降低功能迭代与 bug 修复成本
- **兼容性**：适配主流浏览器，算法可视化脚本兼容不同设备屏幕尺寸
- **扩展性**：支持多 AI 模型集成、第三方组件按需引入，便于功能横向扩展

---

## 三、项目结构

```
web_data_structure/
├── public/                       # 静态资源目录
│   ├── main_js/                  # 可视化脚本模块
│   │   └── *.js                  # 动画对象、控制器等脚本
│   └── assets/                   # 静态图片资源
├── src/
│   ├── App.vue                   # 根组件
│   ├── main.js                   # 入口文件（初始化 Vue 实例、加载全局资源）
│   ├── assets/                   # 需构建处理的静态资源
│   │   ├── css/                  # 全局样式文件
│   │   │   └── tailwind.css      # TailwindCSS 配置
│   │   ├── img/                  # 图片资源
│   │   └── js/                   # 第三方 JS 脚本
│   ├── components/               # 公共组件
│   │   ├── AuthBackground.vue    # 登录/注册背景组件
│   │   ├── AuthBox.vue           # 认证表单容器组件
│   │   ├── CommentSection.vue    # 评论区组件
│   │   ├── CourseList.vue        # 课程列表组件
│   │   ├── chatgpt/              # AI 助手组件
│   │   │   ├── chatgpt_main.vue  # AI 对话主界面
│   │   │   └── Loding.vue        # 加载动画组件
│   │   ├── graph/                # 图论可视化组件
│   │   ├── list/                 # 线性表可视化组件
│   │   ├── tree/                 # 树结构可视化组件
│   │   ├── sort/                 # 排序算法可视化组件
│   │   └── search/               # 查找算法可视化组件
│   ├── libs/                     # 第三方库封装
│   │   ├── coze.ts               # Coze API 封装
│   │   ├── gpt.ts                # GPT API 封装
│   │   └── markdown.ts           # Markdown 渲染配置
│   ├── router/                   # 路由配置
│   │   └── index.js              # 路由规则、导航守卫、懒加载配置
│   ├── stores/                   # Pinia 状态管理
│   │   └── counter.js            # 状态存储示例
│   ├── types/                    # TypeScript 类型定义
│   │   └── index.ts              # 全局类型声明
│   ├── utils/                    # 工具类
│   │   ├── scriptLoader.js       # 算法脚本按需加载工具
│   │   └── avatar.js             # 头像生成工具
│   └── views/                    # 页面视图
│       ├── home.vue              # 首页
│       ├── login.vue             # 登录页面
│       ├── register.vue          # 注册页面
│       ├── navigation.vue        # 导航主页面（课程入口）
│       ├── friends.vue           # 好友管理页面
│       ├── chathome.vue          # AI 助手入口页面
│       ├── list/                 # 线性表课程页面
│       ├── tree/                 # 树结构课程页面
│       ├── graph/                # 图论课程页面
│       ├── sort/                 # 排序算法课程页面
│       ├── search/               # 查找算法课程页面
│       ├── practice/             # 练习模式页面
│       │   ├── heap/             # 堆练习
│       │   ├── searchtree/       # 搜索树练习
│       │   ├── queue/            # 队列练习
│       │   ├── search/           # 图遍历练习
│       │   ├── path/             # 最短路径练习
│       │   └── MST/              # 最小生成树练习
│       └── other/                # 其他页面
│           ├── space.vue         # 个人空间
│           ├── myrecord.vue      # 学习记录
│           └── startpractice.vue # 练习入口
├── .env                          # 环境变量配置
├── .env.production               # 生产环境配置
├── vite.config.js                # Vite 构建配置
├── package.json                  # 依赖配置与脚本命令
├── Dockerfile                    # Docker 构建文件
├── nginx.conf                    # Nginx 配置文件
└── index.html                    # HTML 入口文件
```

---

## 四、核心功能模块

### 4.1 登录认证模块

#### 4.1.1 功能详情
- **注册功能**：支持用户名、密码、邮箱、手机号注册，实时校验输入格式
- **登录功能**：用户名+密码登录，支持密码显示/隐藏切换，提交时显示加载状态
- **状态反馈**：通过 Toast 提示登录/注册成功/失败状态
- **UI 设计**：使用 `AuthBackground.vue` 和 `AuthBox.vue` 组件，卡片式布局配合主题背景

#### 4.1.2 路由守卫
```javascript
// src/router/index.js
router.beforeEach(async (to, from, next) => {
  const isLogin = localStorage.getItem('name')
  
  if (to.name === 'register') return next()
  
  if (!isLogin && to.path !== '/login') return next('/login')
  
  if (isLogin && to.path === '/login') return next('/')
  
  next()
})
```

---

### 4.2 课程与练习模块

#### 4.2.1 课程体系

| 课程分类 | 包含内容 |
|---------|----------|
| 线性表 | 顺序表、单链表、栈、队列、链式队列 |
| 树结构 | 二叉搜索树（BST）、AVL 树、霍夫曼树、堆（小根堆/大根堆）、线索二叉树、二叉树转换 |
| 图论 | 深度优先遍历（DFS）、广度优先遍历（BFS）、Prim 算法、Kruskal 算法、Dijkstra 算法、Floyd 算法、拓扑排序 |
| 排序算法 | 比较排序、堆排序（小根堆/大根堆）、基数排序 |
| 查找算法 | 基础查找、字符串匹配 |

#### 4.2.2 核心优化
- **路由懒加载**：所有课程页面采用动态导入 `() => import('../views/xxx.vue')`
- **算法脚本按需加载**：通过 `scriptLoader.js` 工具，仅在进入算法页面时加载对应脚本
- **脚本预加载**：登录成功后在空闲时间预加载算法脚本

#### 4.2.3 ScriptLoader 工具类
```javascript
// src/utils/scriptLoader.js
class ScriptLoader {
  constructor() {
    this.loadedScripts = new Set()
  }

  loadScript(src) {
    return new Promise((resolve, reject) => {
      if (this.loadedScripts.has(src)) {
        resolve()
        return
      }
      const script = document.createElement('script')
      script.src = src
      script.onload = () => {
        this.loadedScripts.add(src)
        resolve()
      }
      script.onerror = reject
      document.head.appendChild(script)
    })
  }

  async loadAlgorithmScripts() {
    const scripts = [
      '/Algorithm.js',
      '/main_js/Object_control/ObjectManager.js',
      '/main_js/Animation_manager/AnimationManager.js',
      // ... 更多脚本
    ]
    return Promise.all(scripts.map(src => this.loadScript(src)))
  }

  preloadAlgorithmScripts() {
    if (window.requestIdleCallback) {
      window.requestIdleCallback(() => this.loadAlgorithmScripts().catch(() => {}))
    } else {
      setTimeout(() => this.loadAlgorithmScripts().catch(() => {}), 2000)
    }
  }
}

export default new ScriptLoader()
```

---

### 4.3 社交系统模块

#### 4.3.1 功能详情
- **好友申请流程**：支持按用户名搜索用户，发送含自定义消息的好友申请
- **申请管理**：提供好友申请列表（含徽章计数通知），支持同意/拒绝操作
- **好友列表**：展示好友头像、等级、经验值等信息
- **好友管理**：支持删除好友（需二次确认）

#### 4.3.2 相关接口

| 接口 | 方法 | 路径 | 说明 |
|------|------|------|------|
| 发送好友申请 | POST | `/api/friends/apply` | 发送好友请求 |
| 获取申请列表 | GET | `/api/friends/requests` | 分页获取待处理申请 |
| 处理好友申请 | POST | `/api/friends/respond` | 同意或拒绝申请 |
| 获取好友列表 | GET | `/api/friends` | 获取好友列表 |

---

### 4.4 评论与互动模块

#### 4.4.1 功能详情
- **评论发布**：支持在课程页面发布评论，可针对已有评论进行多级回复
- **互动操作**：支持对评论点赞/取消点赞，操作后界面即时更新
- **内容管理**：用户可编辑、删除自己发布的评论
- **信息展示**：显示评论发布相对时间戳、用户头像与用户名

#### 4.4.2 组件使用
评论功能由 `CommentSection.vue` 组件实现，集成在各课程详情页中。

---

### 4.5 AI 智能助手模块

#### 4.5.1 功能详情
- **多模型支持**：支持 GPT-4V 与 Coze 智能体无缝切换
- **多模态交互**：支持点击上传图片、剪贴板粘贴截图提问
- **个性化配置**：支持用户自定义并保存 API Key
- **专业回答**：AI 固定为"算法导师"角色，提供结构化回答

#### 4.5.2 核心实现
```javascript
// src/components/chatgpt/chatgpt_main.vue
const aiType = ref<'gpt' | 'coze'>('coze');

// 图片粘贴处理
function handlePaste(event: ClipboardEvent) {
  const items = event.clipboardData?.items;
  if (items) {
    for (let i = 0; i < items.length; i++) {
      if (items[i].type.indexOf("image") !== -1) {
        const file = items[i].getAsFile();
        if (file) processFile(file);
      }
    }
  }
}

// 切换 AI 模型
function handleAIChange(type: string) {
  localStorage.setItem("aiType", type);
  Notice.info({ title: `已切换到 ${type === 'gpt' ? 'GPT-4V' : 'Coze'} 模式` });
}
```

---

## 五、性能优化策略

### 5.1 构建优化
```javascript
// vite.config.js
build: {
  rollupOptions: {
    output: {
      manualChunks: {
        'vue-vendor': ['vue', 'vue-router'],
        'ui-vendor': ['view-ui-plus'],
        'utils': ['axios']
      }
    }
  },
  chunkSizeWarningLimit: 1000,
  minify: 'terser',
  terserOptions: {
    compress: {
      drop_console: true,
      drop_debugger: true
    }
  }
}
```

### 5.2 资源加载优化
- **路由懒加载**：所有路由组件采用 `dynamic import` 方式
- **算法脚本按需加载**：通过自定义 `ScriptLoader` 工具类，仅在进入特定算法页面时加载
- **空闲预加载**：使用 `requestIdleCallback` 在空闲时间预加载算法脚本

### 5.3 组件优化
- **按需引入**：通过 `unplugin-vue-components` 插件自动按需引入组件
- **组件复用**：提取公共组件减少代码冗余
- **懒渲染**：对长列表采用分页加载

---

## 六、接口交互规范

### 6.1 基础规范
- **接口基础路径**：`/api`
- **数据格式**：请求与响应均采用 JSON 格式
- **统一响应结构**：
```json
{
  "code": 200,
  "message": "success",
  "data": {}
}
```

### 6.2 Axios 配置
```javascript
// src/main.js
const baseURL = import.meta.env.PROD
  ? ""
  : import.meta.env.VITE_APP_BASE_URL || "http://localhost:8080";
axios.defaults.baseURL = baseURL + "/api";
axios.defaults.withCredentials = true;
```

### 6.3 核心接口列表

| 功能模块 | 接口地址 | 请求方法 | 说明 |
|---------|----------|----------|------|
| 用户认证 | `/api/login` | POST | 用户登录 |
| | `/api/register` | POST | 用户注册 |
| | `/api/me/space` | GET/PUT | 获取/更新用户信息 |
| 好友系统 | `/api/friends/apply` | POST | 发送好友申请 |
| | `/api/friends/requests` | GET | 获取好友申请列表 |
| | `/api/friends/respond` | POST | 同意/拒绝好友申请 |
| | `/api/friends` | GET | 获取好友列表 |
| 评论系统 | `/api/comments` | GET/POST | 获取/发布评论 |
| | `/api/comments/{id}` | PUT/DELETE | 编辑/删除评论 |
| | `/api/comments/{id}/like` | POST/DELETE | 点赞/取消点赞 |
| 学习记录 | `/api/me/studyrecord/generatenewrecord` | POST | 生成学习记录 |
| | `/api/me/studyrecord/history` | GET | 查询学习历史 |

---

## 七、部署指南

### 7.1 环境准备

| 依赖项 | 版本要求 | 说明 |
|--------|----------|------|
| Node.js | 18+ | 前端开发与构建必备 |
| Docker | 25+ | 容器化部署必备 |
| Nginx | 任意稳定版本 | 静态资源服务 |

### 7.2 本地开发
```bash
# 1. 克隆代码
git clone [仓库地址]
cd web_data_structure

# 2. 安装依赖
npm install

# 3. 启动开发服务器（默认端口 8081）
npm run dev

# 4. 访问地址
http://localhost:8081
```

### 7.3 生产构建
```bash
# 构建生产包
npm run build

# 预览生产包
npm run preview --host
```

### 7.4 Docker 部署
```bash
# 构建镜像
docker build -t ds-frontend:latest .

# 运行容器
docker run -d \
  --name ds-frontend \
  -p 80:80 \
  --restart always \
  ds-frontend:latest
```

### 7.5 Nginx 配置
```nginx
# nginx.conf
server {
  listen 80;
  server_name localhost;
  root /usr/share/nginx/html;
  index index.html;

  location / {
    try_files $uri $uri/ /index.html;
  }

  location ~* \.(js|css|png|jpg|jpeg|gif|ico|svg)$ {
    expires 7d;
    add_header Cache-Control "public, max-age=604800";
  }
}
```

---

## 八、开发规范

### 8.1 代码规范
- **目录命名**：全小写，多单词用短横线分隔
- **组件命名**：大驼峰式（PascalCase），如 `CommentSection.vue`
- **方法命名**：小驼峰式（camelCase），如 `handleRegister`
- **常量命名**：全大写，下划线分隔

### 8.2 组件开发规范
- **拆分原则**：单一职责，复杂组件拆分为多个基础组件
- **Props 设计**：明确类型、默认值与校验规则
- **样式规范**：使用 scoped 样式避免污染全局

### 8.3 提交规范
- **格式**：`type(scope): description`
- **类型**：`feat`(新功能)、`fix`(修复)、`docs`(文档)、`style`(格式)、`refactor`(重构)

---

## 九、常见问题排查

### 9.1 开发环境问题
- **依赖安装失败**：删除 `node_modules` 与 `package-lock.json` 后重新安装
- **接口跨域**：Vite 已配置代理，确保后端运行在 8080 端口

### 9.2 生产环境问题
- **页面刷新 404**：确保 Nginx 配置 `try_files $uri $uri/ /index.html`
- **静态资源加载失败**：检查 Nginx 根目录配置

---

## 十、版本更新记录

| 版本 | 更新时间 | 更新内容 |
|------|----------|----------|
| 2025 | 2025-01 | 重构前端架构（Vue 3 + Vite）、新增评论系统、优化好友申请流程、增强 AI 助手、全链路性能优化 |
| 2024 | 2024-12 |  |