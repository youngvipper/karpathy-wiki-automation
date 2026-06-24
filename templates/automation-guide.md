# 自动化配置指南

## 配置目标

实现真正的自动化：
1. 聊天时提到某个主题 → Agent 自动采集
2. 提问时 → Agent 自动查询知识库
3. 需要研究时 → Agent 自动深度研究

## 配置步骤

### 步骤 1：安装 karpathy-wiki skill

```bash
# 方式 1：克隆仓库
git clone https://github.com/SherwinQ/karpathy-wiki.git
cp -r karpathy-wiki ~/.workbuddy/skills/

# 方式 2：使用 npx
npx skills add SherwinQ/karpathy-wiki
```

### 步骤 2：初始化知识库

```bash
# 创建知识库目录
mkdir -p D:/Knowledge/MyWiki
cd D:/Knowledge/MyWiki

# 运行初始化脚本
bash ~/.workbuddy/skills/karpathy-wiki/scripts/init-wiki.sh . --template research
```

### 步骤 3：配置 Agent

#### WorkBuddy 配置

复制 `config/workbuddy/CLAUDE.md` 到 `~/.workbuddy/CLAUDE.md`

```bash
cp config/workbuddy/CLAUDE.md ~/.workbuddy/
```

#### Codex 配置

复制 `config/codex/AGENTS.md` 到 `~/.codex/AGENTS.md`

```bash
cp config/codex/AGENTS.md ~/.codex/
```

#### Claude Code 配置

复制 `config/claude-code/CLAUDE.md` 到 `~/.claude/CLAUDE.md`

```bash
cp config/claude-code/CLAUDE.md ~/.claude/
```

### 步骤 4：测试自动化功能

在任意 Agent 中测试：

```bash
# 切换到知识库目录
cd D:/Knowledge/MyWiki

# 测试自动采集
# 输入：我最近在研究 MACD 策略，发现金叉信号挺准的
# 预期：Agent 自动识别并采集

# 测试自动查询
# 输入：量化策略有哪些类型？
# 预期：Agent 自动查询知识库

# 测试自动跳过
# 输入：今天天气不错
# 预期：Agent 跳过，不采集
```

## 自动化机制

### 机制 1：Agent 智能识别

Agent 在对话中自动：
1. **关键词识别**：识别高价值关键词
2. **上下文分析**：分析对话上下文
3. **价值判断**：根据标准判断价值
4. **自动执行**：高价值自动采集

### 机制 2：用户触发确认

用户通过自然语言触发：
- "把这个收录到知识库"
- "记录这个发现"
- "保存这个方案"

Agent 自动：
1. 理解用户意图
2. 判断知识价值
3. 执行采集操作

### 机制 3：定时蒸馏

设置定时任务：
- 每天晚上自动蒸馏当天对话
- 筛选高价值内容
- 批量采集和编译

## 质量控制

### 采集时筛选
1. **价值判断**：根据筛选标准判断
2. **领域匹配**：判断所属领域
3. **完整性检查**：确保信息完整

### 编译时优化
1. **去重处理**：避免重复内容
2. **结构化整理**：统一格式和结构
3. **关联建立**：建立与其他知识的关联

### 定期维护
1. **质量审查**：定期检查知识质量
2. **过时清理**：删除过时内容
3. **索引更新**：保持索引最新

## 使用示例

### 示例 1：自动采集高价值知识

**用户**：我最近在研究 MACD 策略，发现金叉买入信号在趋势明显的市场中挺准的，但震荡市容易假信号。回测数据显示年化收益 18%，最大回撤 10%。

**Agent 自动判断**：
- ✅ 包含原创观点（用户的研究发现）
- ✅ 包含实践经验（趋势市 vs 震荡市）
- ✅ 包含数据支撑（回测结果）
- ✅ 高价值知识，应该采集

**Agent 自动执行**：
1. 创建 `raw/quant/2026-06-24_macd-strategy.md`
2. 编译成 `wiki/quant/macd-strategy.md`
3. 更新索引
4. 回复确认

### 示例 2：跳过低价值内容

**用户**：今天天气不错。

**Agent 自动判断**：
- ❌ 无知识价值
- ❌ 与三个领域无关
- ❌ 不应该采集

**Agent 回复**：
- 不采集，正常对话

### 示例 3：查询时自动引用

**用户**：量化策略有哪些类型？

**Agent 自动执行**：
1. 查询知识库
2. 引用 `[[quant/double-ma-strategy]]` 和 `[[quant/macd-strategy]]`
3. 生成答案
4. 保存查询结果（如果质量高）

## 注意事项

1. **不要过度采集**：只采集真正有价值的知识
2. **保持领域隔离**：三个领域不要混入
3. **定期维护**：每周检查一次知识库健康
4. **质量优先**：宁缺毋滥，质量比数量重要
