# 数据结构学习系统 - 后端文档

## 一、系统概述

### 1.1 系统简介

数据结构学习系统后端是基于 **Spring Boot 3.x** 构建的 RESTful API 服务，为前端数据结构可视化学习平台提供用户认证、好友管理、评论互动、学习记录跟踪等核心功能。系统采用经典的三层架构设计（Controller-Service-DAO），并集成 SpringDoc OpenAPI 实现接口文档自动化生成。

### 1.2 技术栈

| 技术组件 | 版本 | 说明 |
|---------|------|------|
| **Java** | 17 | 运行时环境 |
| **Spring Boot** | 3.1.5 | Web 应用框架 |
| **MyBatis-Plus** | 3.5.1 | 数据访问层 ORM 框架 |
| **MySQL Connector** | 8.0 | 数据库驱动 |
| **SpringDoc OpenAPI** | 2.3.0 | API 文档自动生成 |
| **Spring Security Crypto** | - | 密码加密 |
| **WebSocket** | - | 实时通信支持 |
| **Lombok** | 1.18.30 | 简化代码（自动生成 Getter/Setter 等）|
| **Maven Wrapper** | - | 构建工具（可无需全局安装 Maven）|

### 1.3 核心特性

- ✅ 标准化 RESTful API 设计，易于前后端分离调用
- ✅ OpenAPI 3.0 自动文档生成（Swagger UI）
- ✅ 统一响应格式封装（`Result<T>`）
- ✅ 全局异常处理机制
- ✅ 分层架构清晰（Controller → Service → DAO）
- ✅ Docker 容器化部署支持

---

## 二、项目结构

```
server_data_structure/
├── src/main/java/edu/sufe/
│   ├── Application.java            # Spring Boot 主类
│   ├── bean/                       # 实体类（对应数据库表）
│   │   ├── ActionBean.java         # 用户操作记录
│   │   ├── CommentBean.java        # 评论
│   │   ├── CommentLikeBean.java    # 评论点赞
│   │   ├── CommentReplyBean.java   # 评论回复
│   │   ├── FriendBean.java         # 好友关系
│   │   ├── LearningHistory.java    # 学习记录
│   │   ├── LoginLog.java           # 登录日志
│   │   ├── UserBean.java           # 用户信息
│   │   └── dto/                    # 数据传输对象
│   │       ├── CreateCommentRequest.java
│   │       ├── EditCommentRequest.java
│   │       ├── DeleteCommentRequest.java
│   │       ├── LikeCommentRequest.java
│   │       ├── CommentResponseDto.java
│   │       └── CommentDetailDto.java
│   ├── common/                     # 通用类
│   │   ├── Result.java             # 统一响应格式
│   │   ├── ResultCode.java         # 状态码常量
│   │   ├── PageResponse.java       # 分页响应
│   │   ├── BusinessException.java  # 业务异常类
│   │   └── GlobalExceptionHandler.java  # 全局异常处理器
│   ├── configuration/              # 配置类
│   │   ├── SwaggerConfig.java      # OpenAPI 文档配置
│   │   ├── WebSocketConfig.java    # WebSocket 配置
│   │   └── MyCorsFilter.java       # CORS 跨域配置
│   ├── controller/                 # 控制器层
│   │   ├── UserController.java     # 用户认证与信息管理
│   │   ├── FriendController.java   # 好友列表管理（旧版API）
│   │   ├── FriendRequestController.java  # 好友申请管理（新版API）
│   │   ├── CommentController.java  # 评论系统
│   │   ├── LearningController.java # 学习记录
│   │   ├── LoginLogController.java # 登录日志与用户统计
│   │   ├── ActionController.java   # 用户操作记录
│   │   ├── MySQLController.java    # 数据库工具接口
│   │   ├── ForwardController.java  # 页面转发
│   │   └── WebSocketController.java  # WebSocket 消息处理
│   ├── service/                    # 服务层
│   │   ├── CommentService.java     # 评论业务逻辑
│   │   ├── FriendRequestCacheService.java  # 好友申请缓存服务
│   │   └── impl/                   # 服务实现类
│   ├── dao/                        # 数据访问层
│   │   ├── UserDao.java / UserDaoImpl.java
│   │   ├── FriendDao.java / FriendDaoImpl.java
│   │   ├── CommentDao.java / CommentDaoImpl.java
│   │   ├── LearningDao.java / LearningDaoImpl.java
│   │   ├── ActionDao.java / ActionDaoImpl.java
│   │   └── LoginLogRepository.java / LoginLogRepositoryImpl.java
│   ├── repository/                 # 数据仓库（好友关系）
│   │   └── UserFriendRepository.java
│   ├── model/                      # 领域模型
│   │   └── FriendRequest.java      # 好友申请模型
│   ├── dto/                        # 请求/响应 DTO
│   │   ├── FriendApplyRequest.java
│   │   └── FriendRespondRequest.java
│   └── util/                       # 工具类
│       └── PasswordEncoderUtil.java  # 密码加密工具
├── src/main/resources/
│   ├── static                      # 前端打包文件
│   └── application.properties      # 应用配置
├── pom.xml                         # Maven 依赖配置
├── Dockerfile                      # Docker 构建文件
├── mvnw / mvnw.cmd                 # Maven Wrapper 脚本
└── .dockerignore                   # Docker 忽略文件
```

---

## 三、关键配置

### 3.1 数据库配置

配置文件：`src/main/resources/application.properties`

| 配置项 | 环境变量 | 默认值 |
|--------|---------|--------|
| `spring.datasource.url` | `DB_URL` | `jdbc:mysql://db:3306/ds?...` |
| `spring.datasource.username` | `DB_USERNAME` | `root` |
| `spring.datasource.password` | `DB_PASSWORD` | `00000000` |

> **提示**：可通过环境变量覆盖默认配置，适配不同部署环境。

### 3.2 OpenAPI 文档配置

| 配置项 | 值 |
|--------|-----|
| Swagger UI 路径 | `/swagger-ui.html` |
| API 文档 JSON | `/api-docs` |
| 扫描包 | `edu.sufe.controller` |

---

## 四、统一响应格式

### 4.1 响应结构

所有接口返回统一的 `Result<T>` 格式：

```json
{
  "code": 200,
  "message": "OK",
  "data": { ... }
}
```

### 4.2 状态码定义

| 状态码 | 常量名 | 说明 |
|--------|--------|------|
| `200` | `SUCCESS` | 请求成功 |
| `400` | `BAD_REQUEST` | 请求参数错误 |
| `401` | `UNAUTHORIZED` | 未授权 |
| `403` | `FORBIDDEN` | 无权限访问 |
| `404` | `NOT_FOUND` | 资源不存在 |
| `500` | `INTERNAL_SERVER_ERROR` | 服务器内部错误 |
| `503` | `SERVICE_UNAVAILABLE` | 服务不可用 |
| `1001` | `USER_EXISTS` | 用户已存在 |
| `1002` | `USER_NOT_FOUND` | 用户不存在 |
| `1003` | `PASSWORD_ERROR` | 密码错误 |
| `1004` | `PARAM_VALID_ERROR` | 参数校验失败 |

---

## 五、API 接口详细说明

### 5.1 用户认证与信息（UserController）

| 接口 | 方法 | 路径 | 说明 |
|------|------|------|------|
| 用户登录 | `POST` | `/api/login` | 验证用户名密码，返回用户信息；登录成功后记录日志并增加经验值 |
| 用户注册 | `POST` | `/api/register` | 注册新用户 |
| 获取用户信息 | `GET` | `/api/me/space?username={username}` | 根据用户名查询用户详情 |
| 更新用户信息 | `PUT` | `/api/me/space` | 更新用户的邮箱、电话、密码等信息 |

**登录请求示例**：
```json
// POST /api/login
{
  "username": "testuser",
  "password": "123456"
}
```

**登录响应示例**：
```json
{
  "code": 200,
  "message": "success",
  "data": {
    "userid": "1",
    "username": "testuser"
  }
}
```

---

### 5.2 好友系统

#### 5.2.1 新版好友申请 API（FriendRequestController）

基于缓存的好友申请系统，支持自动匹配双向申请。

| 接口 | 方法 | 路径 | 说明 |
|------|------|------|------|
| 发起好友申请 | `POST` | `/api/friends/apply` | 发送好友请求，支持自动接受双向申请 |
| 获取申请列表 | `GET` | `/api/friends/requests` | 分页获取待处理的好友申请 |
| 处理好友申请 | `POST` | `/api/friends/respond` | 同意或拒绝好友申请 |

**发起好友申请**：
```json
// POST /api/friends/apply
{
  "fromId": 1,
  "toId": 2,
  "message": "我是你的同学"
}
```

**响应状态**：
- `applied` - 申请已发送
- `auto_accepted` - 双向申请自动接受，已成为好友
- `already_friends` - 已是好友关系

**获取申请列表**：
```
GET /api/friends/requests?userId=1&page=0&size=20
```

**处理好友申请**：
```json
// POST /api/friends/respond
{
  "responderId": 2,
  "requesterId": 1,
  "accept": true
}
```

#### 5.2.2 旧版好友 API（FriendController）

直接操作好友关系的简单接口。

| 接口 | 方法 | 路径 | 说明 |
|------|------|------|------|
| 获取好友列表 | `GET` | `/api/friends?username={username}` | 返回用户的所有好友信息 |
| 添加好友 | `POST` | `/api/addFriends?username={user}&friend={friend}` | 直接添加好友 |
| 删除好友 | `POST` | `/api/deleteFriends?username={user}&friend={friend}` | 删除好友关系 |

---

### 5.3 评论系统（CommentController）

完整的课程评论功能，支持回复、点赞、编辑、删除。

| 接口 | 方法 | 路径 | 说明 |
|------|------|------|------|
| 获取评论列表 | `GET` | `/api/comments` | 分页获取课程评论 |
| 获取评论详情 | `GET` | `/api/comments/{id}` | 获取单条评论及其回复 |
| 发布评论/回复 | `POST` | `/api/comments` | 新建评论或回复已有评论 |
| 编辑评论 | `PUT` | `/api/comments/{id}` | 修改评论内容 |
| 删除评论 | `DELETE` | `/api/comments/{id}` | 删除评论 |
| 点赞 | `POST` | `/api/comments/{id}/like` | 对评论点赞 |
| 取消点赞 | `DELETE` | `/api/comments/{id}/like` | 取消评论点赞 |

**获取评论列表参数**：

| 参数 | 类型 | 默认值 | 说明 |
|------|------|--------|------|
| `courseId` | String | 必填 | 课程ID |
| `courseType` | String | 必填 | 课程类型 |
| `page` | Integer | 1 | 页码 |
| `pageSize` | Integer | 20 | 每页条数 |
| `sort` | String | `newest` | 排序方式（newest/oldest） |
| `includeReplies` | Boolean | false | 是否包含回复 |
| `replyLimit` | Integer | 3 | 回复数量限制 |
| `currentUserId` | Long | 可选 | 当前用户ID（用于判断点赞状态） |

**发布评论请求**：
```json
// POST /api/comments
{
  "courseId": "array",
  "courseType": "datastructure",
  "userId": 1,
  "username": "testuser",
  "content": "这个课程讲解得很清晰！",
  "parentId": null,           // 回复时填写父评论ID
  "replyToUserId": null,      // 回复特定用户时填写
  "replyToUsername": null
}
```

---

### 5.4 学习记录（LearningController）

记录用户的学习和练习历史，提供统计功能。

| 接口 | 方法 | 路径 | 说明 |
|------|------|------|------|
| 生成学习记录 | `POST` | `/api/me/studyrecord/generatenewrecord` | 记录用户完成课程学习 |
| 生成练习记录 | `POST` | `/api/me/studyrecord/newpractice` | 记录用户完成课程练习 |
| 查询学习历史 | `GET` | `/api/me/studyrecord/history` | 获取用户学习记录列表 |
| 查询练习历史 | `GET` | `/api/me/studyrecord/Practicehistory` | 获取用户练习记录列表 |
| 统计算法数量 | `GET` | `/api/me/studyrecord/countalgorithm` | 统计用户学习的算法数 |
| 统计课程数量 | `GET` | `/api/me/studyrecord/countcourse` | 统计用户学习的课程数 |
| 获取用户ID | `GET` | `/api/me/studyrecord/getID` | 根据用户名获取用户ID |

**生成学习记录请求**：
```json
// POST /api/me/studyrecord/generatenewrecord
{
  "username": "testuser",
  "topicname": "链表"
}
```

---

### 5.5 登录日志与用户统计（LoginLogController）

| 接口 | 方法 | 路径 | 说明 |
|------|------|------|------|
| 获取上次登录时间 | `GET` | `/api/me/studyrecord/lastlogin` | 返回上一次登录的时间 |
| 统计活跃天数 | `GET` | `/api/me/studyrecord/activedays` | 统计用户活跃天数 |
| 获取用户等级 | `GET` | `/api/me/studyrecord/userlevel` | 获取用户当前等级 |
| 获取用户经验值 | `GET` | `/api/me/studyrecord/userexp` | 获取用户当前经验值 |

---

### 5.6 用户操作记录（ActionController）

用于保存和恢复用户在可视化练习中的操作序列。

| 接口 | 方法 | 路径 | 说明 |
|------|------|------|------|
| 下载操作记录 | `GET` | `/api/download_action` | 获取用户指定类型的操作记录 |
| 上传操作记录 | `POST` | `/api/upload_action` | 保存用户的操作记录 |

**下载操作记录**：
```
GET /api/download_action?username={user}&type={type}
```
- `type`：操作类型（如 `linearlist`、`binarytree` 等）

**上传操作记录**：
```
POST /api/upload_action?username={user}&type={type}&setUpTime={time}&actionList={jsonList}
```

---

## 六、构建与运行

### 6.1 开发环境要求

- JDK 17+
- Maven 3.8+（或使用项目内置的 Maven Wrapper）
- MySQL 8.0+
- IDE：IntelliJ IDEA（推荐）/ Eclipse

### 6.2 本地开发

```bash
# 1. 克隆代码
git clone [仓库地址]
cd server_data_structure

# 2. 配置数据库（修改 application.properties 或设置环境变量）
export DB_URL="jdbc:mysql://localhost:3306/ds?serverTimezone=Asia/Shanghai&useUnicode=true&characterEncoding=utf-8"
export DB_USERNAME="root"
export DB_PASSWORD="your_password"

# 3. 编译运行（使用 Maven Wrapper，无需安装 Maven）
./mvnw spring-boot:run

# 4. 访问 Swagger UI 验证启动成功
# http://localhost:8080/swagger-ui.html
```

### 6.3 构建生产包

```bash
# 使用 Maven Wrapper
./mvnw clean package -DskipTests    # Linux/macOS
mvnw.cmd clean package -DskipTests  # Windows

# 或使用系统 Maven
mvn clean package -DskipTests

# 生成的 JAR 文件
target/_111-0.0.1-SNAPSHOT.jar

# 运行
java -jar target/_111-0.0.1-SNAPSHOT.jar
```

---

## 七、部署指南

### 7.1 单机部署

```bash
# 1. 上传 JAR 包到服务器
scp target/_111-0.0.1-SNAPSHOT.jar user@server:/opt/ds-learning/app.jar

# 2. 创建启动脚本
cat > /opt/ds-learning/start.sh << 'EOF'
#!/bin/bash
cd /opt/ds-learning
nohup java -jar app.jar \
  --spring.profiles.active=prod \
  -Dspring.datasource.url="$DB_URL" \
  > app.log 2>&1 &
echo "Started with PID: $!"
EOF

chmod +x start.sh

# 3. 启动
./start.sh

# 4. 停止
pkill -f "app.jar"
```

### 7.2 Docker 部署

```bash
# 1. 构建镜像（Dockerfile 已在项目根目录）
docker build -t ds-learning:latest .

# 2. 运行容器
docker run -d \
  --name ds-learning \
  -p 8080:8080 \
  -e DB_URL="jdbc:mysql://host.docker.internal:3306/ds" \
  -e DB_USERNAME="root" \
  -e DB_PASSWORD="password" \
  ds-learning:latest

# 3. 查看日志
docker logs -f ds-learning
```

### 7.3 Docker Compose 部署（推荐）

```yaml
# docker-compose.yml
version: '3.8'
services:
  db:
    image: mysql:8.0
    environment:
      MYSQL_ROOT_PASSWORD: 00000000
      MYSQL_DATABASE: ds
    volumes:
      - mysql_data:/var/lib/mysql
    ports:
      - "3306:3306"

  app:
    build: ./server_data_structure
    ports:
      - "8080:8080"
    environment:
      - DB_URL=jdbc:mysql://db:3306/ds?serverTimezone=Asia/Shanghai&useUnicode=true&characterEncoding=utf-8&useSSL=false&allowPublicKeyRetrieval=true
      - DB_USERNAME=root
      - DB_PASSWORD=00000000
    depends_on:
      - db

volumes:
  mysql_data:
```

---

## 八、异常处理机制

### 8.1 全局异常处理器

系统通过 `GlobalExceptionHandler` 统一捕获并处理异常：

```java
@RestControllerAdvice
public class GlobalExceptionHandler {
    
    // 参数校验异常
    @ExceptionHandler(MethodArgumentNotValidException.class)
    public Result<Object> handleValidationException(MethodArgumentNotValidException e) {
        return Result.error(ResultCode.PARAM_VALID_ERROR, "参数校验失败");
    }
    
    // 业务异常
    @ExceptionHandler(BusinessException.class)
    public Result<Object> handleBusinessException(BusinessException e) {
        return Result.error(e.getCode(), e.getMessage());
    }
    
    // 其他异常
    @ExceptionHandler(Exception.class)
    public Result<Object> handleException(Exception e) {
        return Result.error(ResultCode.INTERNAL_SERVER_ERROR, "系统繁忙，请稍后重试");
    }
}
```

### 8.2 自定义业务异常

```java
// 抛出业务异常示例
if (user == null) {
    throw new BusinessException(ResultCode.USER_NOT_FOUND, "用户不存在");
}
```

---

## 九、开发规范

### 9.1 代码规范

| 类型 | 规范 | 示例 |
|------|------|------|
| 包命名 | 全小写，用 `.` 分隔 | `edu.sufe.controller` |
| 类命名 | 大驼峰式 | `UserController`、`CommentService` |
| 方法命名 | 小驼峰式 | `getUserInfo`、`createComment` |
| 常量命名 | 全大写，下划线分隔 | `INTERNAL_SERVER_ERROR` |

### 9.2 新接口开发流程

1. **Controller 层**：定义接口路径、请求方式、参数校验
2. **Service 层**：编写业务逻辑，事务管理
3. **DAO/Repository 层**：实现数据访问
4. **DTO 定义**：请求/响应数据结构
5. **Swagger 注解**：添加 `@Operation`、`@Parameter` 等注解
6. **单元测试**：验证接口功能
7. **代码评审**：提交 PR

### 9.3 Swagger 注解示例

```java
@Operation(summary = "发起好友申请", description = "用户向另一个用户发起好友申请")
@ApiResponses(value = {
    @ApiResponse(responseCode = "201", description = "成功发起申请"),
    @ApiResponse(responseCode = "400", description = "参数错误"),
    @ApiResponse(responseCode = "409", description = "已是好友或已存在未处理申请")
})
public ResponseEntity<Result<Map<String, Object>>> applyFriend(
    @Parameter(description = "好友申请请求") @RequestBody FriendApplyRequest request) {
    // ...
}
```

---

## 十、接口文档访问

启动项目后，可通过以下地址访问自动生成的 API 文档：

| 类型 | URL |
|------|-----|
| Swagger UI（交互式） | `http://<host>:<port>/swagger-ui.html` |
| OpenAPI JSON | `http://<host>:<port>/api-docs` |

> 生产环境建议通过权限控制或配置关闭 Swagger 文档访问。

---

## 十一、附录

### 11.1 数据库表概览

| 表名 | 说明 |
|------|------|
| `user` | 用户信息 |
| `friend` / `user_friend` | 好友关系 |
| `comment` | 课程评论 |
| `comment_reply` | 评论回复 |
| `comment_like` | 评论点赞记录 |
| `learning_history` | 学习记录 |
| `login_log` | 登录日志 |
| `action` | 用户操作记录 |
| `course` | 课程信息 |

### 11.2 术语表

| 术语 | 说明 |
|------|------|
| RESTful API | 符合 REST 设计风格的 API |
| OpenAPI | 接口文档规范（原 Swagger Spec）|
| DTO | 数据传输对象 |
| DAO | 数据访问对象 |
| ORM | 对象关系映射 |

### 11.3 开发人员

- **技术负责人**：廖闻、王雪洋、路毅

### 11.4 版本更新记录

| 版本 | 更新时间 | 更新内容 |
|------|----------|----------|
| 2024 | 2024-12 | 24年版本 |
| 2025 | 2025-01 | 数据库密码加密、API修改、新增好友申请系统、评论功能|