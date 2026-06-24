# Karpathy Wiki - 个人知识管理系统

基于 [Andrej Karpathy 的 LLM Wiki 理念](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f) 构建的个人知识管理系统，支持三个独立领域：量化投资、GIS 测绘质检、日常办公。

## 核心特性

- ✅ **自动化采集**：对话中自动识别和采集知识
- ✅ **知识筛选**：自动判断知识价值，过滤无用信息
- ✅ **领域隔离**：三个领域完全独立，互不污染
- ✅ **多 Agent 支持**：WorkBuddy、Codex、Claude Code 共享知识库
- ✅ **四阶段流水线**：INGEST → COMPILE → QUERY → LINT

## 快速开始

### 1. 安装依赖

```bash
# 安装 karpathy-wiki skill
git clone https://github.com/SherwinQ/karpathy-wiki.git
cp -r karpathy-wiki ~/.workbuddy/skills/

# 或使用 npx
npx skills add SherwinQ/karpathy-wiki
```

### 2. 初始化知识库

```bash
# 创建知识库目录
mkdir -p D:/Knowledge/MyWiki
cd D:/Knowledge/MyWiki

# 运行初始化脚本
bash ~/.workbuddy/skills/karpathy-wiki/scripts/init-wiki.sh . --template research
```

### 3. 配置自动化

复制本项目的配置文件到对应位置：

```bash
# WorkBuddy
cp config/workbuddy/CLAUDE.md ~/.workbuddy/

# Codex
cp config/codex/AGENTS.md ~/.codex/

# Claude Code
cp config/claude-code/CLAUDE.md ~/.claude/
```

### 4. 开始使用

在任意 Agent 中：
```bash
cd D:/Knowledge/MyWiki
# 然后自然对话，Agent 会自动识别和采集知识
```

## 项目结构

```
karpathy-wiki-automation/
├── README.md                      # 本文档
├── LICENSE                        # MIT 许可证
├── config/                        # 配置文件
│   ├── workbuddy/
│   │   └── CLAUDE.md             # WorkBuddy 配置
│   ├── codex/
│   │   └── AGENTS.md             # Codex 配置
│   └── claude-code/
│       └── CLAUDE.md             # Claude Code 配置
├── templates/                     # 知识库模板
│   ├── purpose.md                # 知识库目标模板
│   ├── knowledge-filter.md       # 知识筛选标准
│   └── automation-guide.md       # 自动化配置指南
├── examples/                      # 示例文件
│   ├── quant/                    # 量化投资示例
│   ├── gis/                      # GIS 测绘示例
│   └── office/                   # 日常办公示例
└── scripts/                       # 工具脚本
    ├── init-wiki.sh              # 初始化脚本
    └── auto-maintenance.sh       # 自动维护脚本
```

## 自动化机制

### 触发条件

当对话中出现以下内容时，Agent 自动触发知识库操作：

#### 量化投资 (quant)
- 关键词：策略、回测、均线、MACD、RSI、布林带、量化、交易
- 触发动作：自动采集 + 编译

#### GIS 测绘 (gis)
- 关键词：DOM、DEM、精度、质检、测绘、检验、误差
- 触发动作：自动采集 + 编译

#### 日常办公 (office)
- 关键词：模板、周报、邮件、Excel、PPT、自动化、效率
- 触发动作：自动采集 + 编译

### 知识筛选标准

#### 必须采集（高价值）
1. **原创观点**：用户自己的见解、分析、总结
2. **实践经验**：实际操作中发现的技巧、踩过的坑
3. **数据分析**：回测结果、精度检验数据、效率对比
4. **解决方案**：解决具体问题的方法和步骤
5. **最佳实践**：经过验证的有效方法

#### 不采集（低价值）
1. **简单问答**：简单的"是/否"回答
2. **重复内容**：与已有知识重复的信息
3. **临时信息**：临时性的、无长期价值的内容
4. **情绪表达**：纯情绪化的表达，无实质内容
5. **碎片信息**：零散的、无法形成完整知识的信息

## 使用示例

### 示例 1：自动采集

**你说**：
```
我最近在研究 MACD 策略，发现金叉买入信号在趋势明显的市场中挺准的，
但震荡市容易假信号。回测数据显示年化收益 18%，最大回撤 10%。
```

**Agent 自动做的**：
1. 自动识别：MACD 策略 → 量化投资领域
2. 自动判断：高价值知识（原创观点 + 数据支撑）
3. 自动执行：采集 + 编译 + 更新索引
4. 回复确认

### 示例 2：自动查询

**你说**：
```
量化策略有哪些类型？
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

## 多 Agent 协作

### 分工方案

| Agent | 负责领域 | 使用场景 |
|-------|----------|----------|
| WorkBuddy | 量化投资 | 策略研究、回测分析、文章创作 |
| Claude Code | GIS 测绘 | 质检标准、自动化脚本、可视化 |
| Codex | 日常办公 | 模板管理、效率工具、自动化 |

### 共享机制

- 三个 Agent 共享同一个知识库：`D:/Knowledge/MyWiki/`
- 三个 Agent 都配置了相同的自动化规则
- 三个 Agent 都遵循相同的筛选标准

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
