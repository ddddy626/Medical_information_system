---
AIGC:
    Label: "1"
    ContentProducer: 001191440300708461136T1XGW3
    ProduceID: a6cc81b1715172b477c70fb5d7fbe175_9e4aaa41b62411f19287525400638852
    ReservedCode1: Qui3C88hZdBTJgUDwyYZ2nOhtvCXiEEBmUw74gM4lSlKwQGX/vWvt6j9hf9H1oQ12bdu6C8yP1csKMfH7vfd+21M5uV2gtdfwhlVRBxi1PWtRGECgDI2Zk2OrHXWmj3laqX6ZZpp6NSWPw1Fb+0IyiXO+HARf41NFHLYyziY4jvVNzE62cSsX+aQqJo=
    ContentPropagator: 001191440300708461136T1XGW3
    PropagateID: a6cc81b1715172b477c70fb5d7fbe175_9e4aaa41b62411f19287525400638852
    ReservedCode2: Qui3C88hZdBTJgUDwyYZ2nOhtvCXiEEBmUw74gM4lSlKwQGX/vWvt6j9hf9H1oQ12bdu6C8yP1csKMfH7vfd+21M5uV2gtdfwhlVRBxi1PWtRGECgDI2Zk2OrHXWmj3laqX6ZZpp6NSWPw1Fb+0IyiXO+HARf41NFHLYyziY4jvVNzE62cSsX+aQqJo=
---



# doctor-codex 智慧门诊系统

基于 Spring Boot 的医院门诊管理系统，包含患者端、医生端与管理端三套界面，覆盖挂号预约、在线问诊、电子病历、检查检验、药品与费用、消息通知、AI 辅助问诊、天气提示等功能。

## 一、技术栈

| 层次 | 技术 |
| --- | --- |
| 后端框架 | Spring Boot 2.7.5、Spring MVC、MyBatis 2.2.2 |
| 数据库 | MySQL 8.x（库名 `hospital_db`，字符集 `utf8mb4`） |
| 连接池 | Apache Commons DBCP2 |
| 缓存 / 中间件 | Redis（验证码、分布式锁、可选会话存储）、Sentinel 1.8.6（AI 接口流控） |
| 敏感配置 | Jasypt 3.0.5（`ENC(...)` 密文加密） |
| 权限 | Apache Shiro 1.8.0（密码哈希） |
| 前端 | 原生 HTML + CSS + JS（`src/main/webapp`，通过 fetch 调用 REST 接口） |
| 其他 | QQ 邮箱 SMTP、DeepSeek AI、百度语音识别、百度 OCR、和风天气 |
| 构建 | Maven（JDK 17），打包方式 `war` |

接口统一前缀 `/doctor`，返回模型统一为 `ReturnVO { code, msg, content }`，`code = 1` 表示成功。

## 二、目录结构

```
doctor-codex/
├── .gitignore                                  # 已排除所有含明文密码/密钥的配置文件
├── README.md                                   # 本文件
└── doctor/                                     # Spring Boot 工程根目录
    ├── pom.xml
    ├── mvnw.cmd                                # Maven Wrapper（Windows）
    ├── HELP.md
    ├── hospital_db.sql                         # 数据库结构与基础数据（Navicat 导出）
    ├── scripts/
    │   ├── setup-db.ps1                        # 一键初始化数据库脚本
    │   └── setup-db.bat
    ├── sql/
    │   ├── 00-init-database.sql                # 建库语句（须最先执行）
    │   └── 01-supplement-tables.sql            # 补充表语句
    └── src/main/
        ├── java/com/dyh/doctor/                # 启动类、Controller、Service、Mapper、Entity、Util
        ├── resources/
        │   ├── application.properties.example  # ★ 可上传的配置模板（值留空）
        │   ├── application.properties          # 本机真实配置（已被 .gitignore 排除）
        │   ├── application-local.properties    # 本机覆盖配置（已被 .gitignore 排除）
        │   └── mapper/*.xml                    # MyBatis 映射文件
        └── webapp/                             # 静态页面（index.html、doctor-*.html、patient-*.html）
```

## 三、环境要求（必须项）

| 必须项 | 版本 / 要求 | 说明 |
| --- | --- | --- |
| JDK | 17 | `pom.xml` 中 `<java.version>17</java.version>` |
| Maven | 3.8+ | 可直接使用工程自带 `mvnw.cmd`，无需单独安装 |
| MySQL | 8.x | 数据库名 `hospital_db`，字符集 `utf8mb4`；`pom.xml` 使用 `mysql-connector-j 8.0.33` |
| Redis | 5.0+ | 默认 `localhost:6379`；用于验证码、分布式锁。无密码时 `spring.redis.password` 留空（未安装不影响启动，仅相关功能不可用） |
| 端口 | 8081 | 被占用时修改 `server.port` |
| 可选：SMTP / AI / OCR / 天气账号 | — | 缺失时对应功能不可用，不影响系统启动 |

> 说明：上表中只有 JDK、Maven 属于构建 / 启动必需项。MySQL、Redis 未安装或未填写时，应用**仍能正常启动**，只是对应业务功能不可用（实测结论见「五、启动依赖与最小可启动配置清单」）。

## 四、快速开始

### 1. 获取代码

```bash
git clone <仓库地址>
cd doctor-codex
```

### 2. 创建并填写配置文件（关键步骤）

仓库**不含**真实配置文件，克隆后必须先由模板生成：

```powershell
cd doctor\src\main\resources
copy application.properties.example application.properties
```

然后用编辑器打开 `application.properties`，把下面「五、必须自行填写的配置项清单」中标注为必填的空值逐项填好。

> 模板文件 `application.properties.example` 中所有敏感值均为空白，仅保留键名、注释与说明。
> 真实配置文件 `application.properties` / `application-local.properties` 已被 `.gitignore` 排除，**不会被提交**，请勿手动 `git add -f`。

### 3. 初始化数据库

方式一（推荐，一键执行）：

```powershell
# 在 doctor 目录下执行；端口/账号请按本机 MySQL 修改
powershell -ExecutionPolicy Bypass -File .\scripts\setup-db.ps1 -Port 3306 -User root -Password "你的MySQL密码"
```

方式二（手动，按顺序在 Navicat / 命令行中执行）：

1. `sql/00-init-database.sql` —— 创建数据库 `hospital_db`
2. `hospital_db.sql` —— 导入表结构与基础数据
3. `sql/01-supplement-tables.sql` —— 补充表

### 4. 启动项目

方式一（命令行）：

```powershell
cd doctor
.\mvnw.cmd spring-boot:run
```

方式二（IDEA）：导入 `doctor` 目录为 Maven 工程，运行主类 `com.dyh.doctor.SpbYqApplication`。

打包部署（war）：

```powershell
cd doctor
.\mvnw.cmd clean package
# 产物：doctor\target\spbYq-0.0.1-SNAPSHOT.war
```

### 5. 访问系统

启动成功后访问：**http://localhost:8081/doctor/**

数据库初始化脚本内置测试账号（密码均为 `123456`）：

| 角色 | 账号 |
| --- | --- |
| 管理员 | `admin` |
| 患者 | `patient1` |
| 医生 | `doctor_001` |

## 五、启动依赖与最小可启动配置清单

### 1. 实测结论：模板能否上传、按模板填写能否启动

| 验证项 | 结果 |
| --- | --- |
| `application.properties.example` 能否被 git 跟踪 | **能**。纳入版本控制后，`git status --porcelain` 显示 `A  doctor/src/main/resources/application.properties.example`，`git ls-files` 可列出该文件（`.gitignore` 末尾的 `!**/*.example` 已豁免） |
| 真实配置是否确实被排除 | **是**。`git check-ignore -v` 命中 `.gitignore:39:**/application.properties`；`application-local.properties` 同样未进入待提交列表 |
| 复制模板 → 填写 → 能否启动 | **能**。实测以模板为配置文件（敏感项填占位值，数据库指向一个不存在的端口、未设置 `JASYPT_PWD`），应用正常启动：`Started SpbYqApplication in 6.206 seconds`，Tomcat 正常监听，`GET /doctor/` 返回 200（首页 153960 字节） |

### 2. 启动期依赖分析（结论：无「不填必挂」项）

- 启动类 `SpbYqApplication` 为常规 Spring Boot 启动，无额外初始化逻辑；全工程**无** `CommandLineRunner` / `ApplicationRunner` / `ApplicationReadyEvent` 监听。
- `@PostConstruct` 仅 2 处：`SentinelConfig`（仅在本地加载限流规则）、`MailUtil`（仅打印日志，`JavaMailSender` 注入为 `required=false`），均不访问外部服务。
- 数据源为 DBCP2 连接池（`initialSize` 默认 0），且工程内**无** `schema.sql` / `data.sql`，启动阶段不会主动建立数据库连接。
- Redis 为懒连接：`RedisTemplate` 创建时不连接服务器，`spring.session.store-type=none` 也不使用 Redis 会话；`CacheUtil` 对 Redis 异常静默降级。
- 定时任务（就诊提醒 08:00、站点数据同步每 5 分钟）在启动后延迟触发，且内部 `try/catch` 兜底，异常仅记日志。
- 所有 `@Value` 占位符均带默认值（如 `${deepseek.api.key:}`、`${spring.mail.username:}`），属性缺失也不会导致启动失败。

**因此：不存在"不填就必定启动失败"的配置项**；唯一例外是「使用 `ENC(...)` 密文但没有提供 Jasypt 主密码」（见下表末行）。

### 3. 最小可启动配置清单（只填这几项即可启动并登录）

| 配置项 | 需要填写 | 留空 / 填错的后果 |
| --- | --- | --- |
| `spring.datasource.username` | 本机 MySQL 用户名 | 应用仍能启动，但登录、挂号、病历等**所有涉及数据库的接口报 500**（实测：`CannotGetJdbcConnectionException: Failed to obtain JDBC Connection`） |
| `spring.datasource.password` | 本机 MySQL 密码 | 同上（连接被拒 / `Access denied for user`） |
| `spring.datasource.url` | 端口须与本机 MySQL 一致（模板默认 3306） | 同上，端口错则连接被拒 |

### 4. 其余配置项留空的后果（均不影响启动，仅对应功能不可用）

| 配置项 | 获取方式 | 留空后的影响 |
| --- | --- | --- |
| `spring.redis.*` | 本机 Redis 地址，无密码时 `password` 留空 | 验证码（注册 / 找回密码）、分布式锁、缓存与站点访问统计不可用；`CacheUtil` 自动降级为直接查库 |
| `spring.mail.username` / `spring.mail.password` | QQ 邮箱地址 + SMTP 授权码（非登录密码），QQ邮箱 → 设置 → 账户 → 开启 SMTP 服务 | 注册验证码邮件、找回密码邮件、就诊前一日 08:00 提醒邮件发送失败 |
| `deepseek.api.key` | https://platform.deepseek.com | AI 智能问诊 / 辅助建议接口失败 |
| `baidu.voice.app-id` / `api-key` / `secret-key` | https://console.bce.baidu.com/ai/ | 语音识别失败，提示「百度 API Key / Secret 未配置或解密失败」 |
| `baidu.image.app-id` / `api-key` / `secret-key` | 同上（OCR 应用） | 病历 / 检查单 OCR 识别失败，提示同上 |
| `hefeng.api.key` / `hefeng.api.host` | https://console.qweather.com/setting（`api.host` 为控制台分配的专属域名，非密钥） | 首页天气与健康提示不可用 |
| `jasypt.encryptor.password` | 自行设定；或用环境变量 `JASYPT_PWD` 提供 | **仅当配置中存在 `ENC(...)` 密文时才必须**：不填会因无法解密而抛 `EncryptionOperationNotPossibleException`，属**启动失败**；全部使用明文时留空即可，不影响启动 |
| `sentinel.dashboard.server` | Sentinel 控制台地址 | 仅控制台不可见，不影响运行 |

补充说明：

- **端口不一致**：`scripts/setup-db.ps1` 默认端口为 `3306`，若本机 MySQL 监听其他端口（例如 `3309`），初始化脚本与 `spring.datasource.url` 必须填写同一个端口。
- **Redis 未安装**：可先安装并启动 Redis 后再运行；会话默认使用本地内存存储（`spring.session.store-type=none`）。
- **加密存储（可选）**：若不想在配置文件中写明文，可用 Jasypt 生成 `ENC(...)` 密文替换对应值，并在环境变量 `JASYPT_PWD` 中设置主密码；IDEA 需重启后才能读到新设的环境变量。

## 六、敏感信息与仓库安全说明

### 1. 不会上传的文件（已被 `.gitignore` 排除）

| 文件 / 目录 | 原因 |
| --- | --- |
| `**/application.properties` | 含 Jasypt 主密码、数据库密码、各类 API Key（明文或密文） |
| `**/application-*.properties`（如 `application-local.properties`） | 本机覆盖配置，含明文第三方密钥 |
| `**/application-*.yml` / `**/bootstrap*.yml` | 同上，避免后续改用 yml 时误提交 |
| `.env` / `.env.*` / `*.env` | 环境变量文件，通常含密钥 |
| `**/.idea/dataSources.xml`、`**/.idea/dataSources/` | IDEA 数据源配置，含数据库连接串与账号 |
| `**/secrets/`、`**/*-secret.*`、`**/*.pem`、`**/*.key`、`**/*.jks`、`**/*.keystore`、`**/*.p12` | 常见密钥 / 证书文件 |
| `**/target/`、`**/.idea/`、`*.log` | 构建产物、IDE 配置、日志 |

### 2. 会上传的文件

- `application.properties.example`：配置模板，全部敏感值留空。
- `application-local.properties.example`：本机覆盖配置的示例，无真实值。
- `.gitignore` 中已用 `!**/*.example`、`!**/*.template` 显式豁免模板类文件，避免被上面的规则误伤。
- 已实测：`git add` 之后，只有 `application.properties.example` 进入待提交列表，`application.properties` 与 `application-local.properties` 均被忽略（详见第五节实测结论）。

### 3. 安全提醒

- `scripts/setup-db.ps1` 中内置了默认 MySQL 密码（`$Password` 参数），属于明文口令。建议本地执行时通过 `-Password "你的密码"` 显式传入，或直接修改为自己环境的占位值，不要保留真实生产密码。
- 若历史提交中曾包含真实密码 / 密钥，仅添加 `.gitignore` 无法消除泄露，需**立即轮换（重置）所有已泄露的密码与密钥**，并清理 Git 历史（如 `git filter-repo` 或 BFG）。
- 请勿使用 `git add -f` 强制提交被忽略的配置文件。

## 七、常见问题

| 现象 | 排查方向 |
| --- | --- |
| 启动后访问接口报 500、日志出现 `CannotGetJdbcConnectionException` / `Communications link failure` | MySQL 未启动，或 `spring.datasource.url` 的端口 / 库名不对（**不影响应用启动，仅数据库相关功能不可用**） |
| 接口报 `Access denied for user` | 数据库用户名或密码填写有误（同样不影响应用启动） |
| 启动报解密失败（`EncryptionOperationNotPossibleException`） | 使用了 `ENC(...)` 密文但 `JASYPT_PWD` 未设置或与加密时不一致 |
| 端口 8081 被占用 | 修改 `server.port` |
| 验证码 / 邮件发送失败 | `spring.mail` 账号或 SMTP 授权码未填写 |
| AI 问诊、语音、OCR、天气功能不可用 | 对应的 API Key 未填写或已失效 |
| 页面 404 | 访问路径需带上下文前缀：`http://localhost:8081/doctor/` |
*（内容由AI生成，仅供参考）*
*（内容由AI生成，仅供参考）*
