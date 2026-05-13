# 简易论坛系统

基于 SSM（Spring MVC + Spring + MyBatis）+ MySQL 的简易论坛系统。

## 功能模块

- 用户注册 / 登录 / 注销
- 帖子列表查看
- 发布新帖子
- 查看帖子详情
- 回复帖子
- 帖子搜索

## 技术栈

- 后端框架：Spring MVC 5.3.25 + Spring 5.3.25 + MyBatis 3.5.11
- 数据库：MySQL 8.0
- 连接池：Druid 1.2.16
- 前端技术：HTML + CSS + Bootstrap 3.4.1
- 项目管理：Maven

## 项目结构

```
forum-system/
├── pom.xml
├── sql/
│   └── forum_db.sql          # 数据库脚本
├── src/
│   └── main/
│       ├── java/com/forum/
│       │   ├── controller/   # 控制器层
│       │   ├── service/      # 服务层
│       │   ├── mapper/       # MyBatis Mapper接口
│       │   └── model/        # 实体类
│       ├── resources/
│       │   ├── application.properties
│       │   ├── spring.xml    # Spring配置
│       │   ├── mybatis-config.xml
│       │   ├── logback.xml
│       │   └── mapper/       # MyBatis XML映射文件
│       └── webapp/
│           ├── WEB-INF/
│           │   ├── web.xml
│           │   └── views/    # JSP视图文件
│           └── static/       # 静态资源
└── README.md
```

## 环境要求

- JDK 1.8+
- Maven 3.x
- MySQL 5.7+ / 8.0+
- IntelliJ IDEA 或 Eclipse

## 配置说明

修改 `src/main/resources/application.properties` 中的数据库连接信息：

```properties
jdbc.driver=com.mysql.cj.jdbc.Driver
jdbc.url=jdbc:mysql://localhost:3306/forum_db?useSSL=false&serverTimezone=UTC&characterEncoding=utf8
jdbc.username=root
jdbc.password=your_password
```

## 运行步骤

### 1. 创建数据库

```bash
mysql -u root -p < sql/forum_db.sql
```

### 2. 导入项目到IDE

使用 IntelliJ IDEA 或 Eclipse 导入 Maven 项目。

### 3. 配置数据库连接

修改 `application.properties` 中的数据库用户名和密码。

### 4. 运行项目

使用 Maven 构建并运行：

```bash
mvn clean compile
mvn tomcat7:run
```

或使用 IDE 内置的 Tomcat 服务器运行。

### 5. 访问系统

打开浏览器访问：http://localhost:8080/forum-system/

### 测试账号

| 用户名 | 密码 | 角色 |
|--------|------|------|
| admin | 123456 | 管理员 |
| user1 | 123456 | 普通用户 |
| user2 | 123456 | 普通用户 |

## 页面说明

- `/` - 首页
- `/user/login` - 用户登录
- `/user/register` - 用户注册
- `/post/list` - 帖子列表
- `/post/add` - 发布帖子
- `/post/detail/{id}` - 帖子详情

## 报告要求

项目按照《Web项目开发实训》报告要求完成，包含以下章节：

1. 项目概述
2. 功能实现
3. 技术栈
4. 项目结构
5. 代码实现
6. 项目演示截图
7. 遇到的问题与解决方案
8. 总结与展望