# Karpathy Wiki Automation

基于 [Andrej Karpathy 的 LLM Wiki 理念](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f) 构建的**通用个人知识管理系统**。

> 知识只需要整理一次，之后一直维护更新，不用每次提问都重新推导。

## 核心特性

- **自动化采集**：对话中自动识别和采集知识
- **知识筛选**：自动判断知识价值，过滤无用信息
- **领域隔离**：多领域完全独立，互不污染
- **多 Agent 支持**：兼容 WorkBuddy、Codex、Claude Code 等主流 AI Agent
- **四阶段流水线**：INGEST → COMPILE → QUERY → LINT

## 快速开始

### 1. 安装 karpathy-wiki skill

```bash
# 方式 1：克隆仓库
git clone https://github.com/SherwinQ/karpathy-wiki.git
cp -r karpathy-wiki ~/.workbuddy/skills/

# 方式 2：使用 npx
npx skills add SherwinQ/karpathy-wiki
```

### 2. 初始化知识库

```bash
# 运行初始化脚本
bash scripts/setup.sh
```

或手动初始化：

```bash
# 创建知识库目录
mkdir -p ~/MyWiki
cd ~/MyWiki

# 运行 karpathy-wiki 初始化
bash ~/.workbuddy/skills/karpathy-wiki/scripts/init-wiki.sh . --template research
```

### 3. 定义你的领域

编辑 `purpose.md`，定义你自己的知识领域：

```markdown
## 领域定义

### 领域一：[你的领域名称]
- 子领域：xxx、xxx、xxx
- 关键词：xxx、xxx、xxx

### 领域二：[你的领域名称]
- 子领域：xxx、xxx、xxx
- 关键词：xxx、xxx、xxx
```

### 4. 配置 Agent

将 `config/templates/agent-config.md` 复制到你的 Agent 配置目录：

```bash
# WorkBuddy
cp config/templates/agent-config.md ~/.workbuddy/CLAUDE.md

# Codex
cp config/templates/agent-config.md ~/.codex/AGENTS.md

# Claude Code
cp config/templates/agent-config.md ~/.claude/CLAUDE.md
```

### 5. 开始使用

```bash
cd ~/MyWiki
# 然后自然对话，Agent 会自动识别和采集知识
```

## 项目结构

```
karpathy-wiki-automation/
├── README.md                          # 本文档
├── LICENSE                            # MIT 许可证
├── .gitignore                         # Git 忽略文件
├── config/
│   └── templates/
│       └── agent-config.md            # Agent 配置模板（通用）
├── templates/
│   ├── purpose-template.md            # 知识库目标模板
│   ├── domain-template.md             # 领域定义模板
│   ├── knowledge-filter.md            # 知识筛选标准
│   └── automation-guide.md            # 自动化配置指南
├── examples/
│   └── sample-article.md              # 示例 Wiki 文章
└── scripts/
    ├── setup.sh                       # 初始化脚本
    └── auto-maintenance.sh            # 自动维护脚本
```

## 领域配置

本项目是**通用框架**，不预设任何具体领域。你需要在 `purpose.md` 中定义自己的领域。

### 领域定义示例

```markdown
### 领域一：技术研究
- 子领域：编程语言、框架、架构设计
- 关键词：代码、架构、设计模式、性能优化

### 领域二：项目管理
- 子领域：需求分析、进度管理、团队协作
- 关键词：需求、排期、复盘、迭代

### 领域三：学习笔记
- 子领域：读书笔记、课程总结、概念理解
- 关键词：学习、总结、笔记、概念
```

### 领域隔离规则

- 每个领域独立目录：`raw/<domain>/`、`wiki/<domain>/`
- 文章必须标注 `domain` 字段
- 查询时可按领域过滤

## 自动化机制

### 知识筛选标准

#### 必须采集（高价值）
1. **原创观点**：用户自己的见解、分析、总结
2. **实践经验**：实际操作中发现的技巧、踩过的坑
3. **数据分析**：统计数据、实验结果、对比分析
4. **解决方案**：解决具体问题的方法和步骤
5. **最佳实践**：经过验证的有效方法

#### 不采集（低价值）
1. **简单问答**：简单的"是/否"回答
2. **重复内容**：与已有知识重复的信息
3. **临时信息**：临时性的、无长期价值的内容
4. **情绪表达**：纯情绪化的表达，无实质内容
5. **碎片信息**：零散的、无法形成完整知识的信息

### 自动操作流程

```
用户发言
    ↓
Agent 自动识别
    ↓
判断是否高价值（筛选标准）
    ↓
[是] → 自动采集 + 编译 + 更新索引
[否] → 跳过，不采集
    ↓
回复用户确认
```

## 使用示例

### 示例 1：自动采集高价值知识

**你说**：
```
我最近在研究微服务架构，发现对于小团队来说，
单体架构可能更合适。因为微服务带来的运维复杂度
远超其收益，尤其是在团队少于 10 人的情况下。
```

**Agent 自动做的**：
1. 自动识别：微服务架构 → 技术研究领域
2. 自动判断：高价值知识（原创观点 + 实践经验）
3. 自动执行：采集 + 编译 + 更新索引
4. 回复确认

### 示例 2：自动查询

**你说**：
```
微服务和单体架构的优缺点是什么？
```

**Agent 自动做的**：
1. 自动查询知识库
2. 引用相关文章
3. 生成答案
4. 保存查询结果

### 示例 3：自动跳过

**你说**：
```
今天天气不错。
```

**Agent 自动做的**：
1. 自动识别：无知识价值
2. 自动跳过，不采集
3. 正常对话回复

## 多 Agent 支持

本项目支持任意 AI Agent，只需将配置文件复制到对应位置即可。

### 支持的 Agent

| Agent | 配置文件路径 |
|-------|-------------|
| WorkBuddy | `~/.workbuddy/CLAUDE.md` |
| Codex | `~/.codex/AGENTS.md` |
| Claude Code | `~/.claude/CLAUDE.md` |

### 共享机制

- 所有 Agent 共享同一个知识库
- 所有 Agent 都配置了相同的自动化规则
- 所有 Agent 都遵循相同的筛选标准

## 引用

本项目基于以下资源构建：

1. **Andrej Karpathy 的 LLM Wiki 理念**
   - 原始 Gist：https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f
   - 推文：https://x.com/karpathy/status/2039805659525644595

2. **SherwinQ/karpathy-wiki 项目**
   - GitHub：https://github.com/SherwinQ/karpathy-wiki
   - 基于 Karpathy 理念的开源实现

3. **obsidian-wiki 项目**
   - GitHub：https://github.com/Ar9av/obsidian-wiki
   - Obsidian 集成方案

4. **GBrain 项目**
   - GitHub：https://github.com/garrytan/gbrain
   - 个人 AI 知识大脑

## 许可证

MIT License - 详见 [LICENSE](LICENSE)

## 贡献

欢迎提交 Issue 和 Pull Request！

## 致谢

- Andrej Karpathy 提出的 LLM Wiki 理念
- SherwinQ/karpathy-wiki 项目的开源实现
- Obsidian 社区的支持
