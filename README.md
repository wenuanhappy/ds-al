# DS-AL 数据结构可视化学习平台

一个"学习 + 社交 + 智能辅助"三位一体的数据结构与算法学习平台。

## 项目简介

本项目旨在通过**交互式可视化**降低数据结构与算法的理解门槛，通过**社交协作**构建学习社区，通过**AI 智能辅助**提供个性化答疑。

## 技术栈

### 前端
- Vue 3 + Composition API
- Vite 构建工具
- Pinia 状态管理
- Element Plus + View UI Plus
- TailwindCSS

### 后端
- Spring Boot 3.1.5
- MyBatis Plus
- MySQL 8.0
- WebSocket (实时通讯)

## 项目结构

```
ds-al/
├── frontend/          # 前端项目 (Vue 3)
├── backend/           # 后端项目 (Spring Boot)
├── doc/               # 项目文档
├── docker-compose.yml # Docker 编排配置
├── ds-al.sql          # 数据库初始化脚本
└── .gitignore         # Git 忽略规则
```

## 快速部署

### 环境要求
- Docker >= 25
- Docker Compose

### 部署步骤

1. 构建并启动所有服务：
```bash
docker compose up -d --build
```

2. 访问前端页面：
```
http://localhost:9100
```

## 开发环境

### 前端开发
```bash
cd frontend
npm install
npm run dev    # 访问 http://localhost:8081
```

### 后端开发
```bash
cd backend
./mvnw clean package -DskipTests
java -jar target/_111-0.0.1-SNAPSHOT.jar
```

## 主要功能

- ✅ 数据结构可视化（线性表、树、图、排序、查找）
- ✅ 交互式算法练习
- ✅ 好友系统与社交互动
- ✅ 评论与讨论区
- ✅ AI 智能助手答疑
- ✅ 个人学习记录

## 文档

更多文档请查看 [`doc/`](./doc/) 目录：
- `ds-架构文档.md` - 系统架构设计
- `ds-前端文档.md` - 前端开发文档
- `ds-后端文档.md` - 后端开发文档
- `2.deploy.md` - 部署指南

## 开源协议

本项目仅供学习交流使用。
