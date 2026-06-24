#!/bin/bash
# Karpathy Wiki Automation 初始化脚本
# 用于快速设置个人知识管理系统

echo "=========================================="
echo "Karpathy Wiki Automation 初始化"
echo "=========================================="
echo ""

# 1. 检查依赖
echo "1. 检查依赖..."
if command -v git &> /dev/null; then
    echo "✅ Git 已安装"
else
    echo "❌ Git 未安装，请先安装 Git"
    exit 1
fi

# 2. 获取知识库路径
echo ""
echo "2. 设置知识库路径..."
DEFAULT_WIKI_DIR="$HOME/MyWiki"
read -p "请输入知识库路径 [$DEFAULT_WIKI_DIR]: " WIKI_DIR
WIKI_DIR=${WIKI_DIR:-$DEFAULT_WIKI_DIR}

if [ -d "$WIKI_DIR" ]; then
    echo "⚠️ 知识库目录已存在：$WIKI_DIR"
else
    mkdir -p "$WIKI_DIR"
    echo "✅ 知识库目录已创建：$WIKI_DIR"
fi

# 3. 初始化目录结构
echo ""
echo "3. 初始化目录结构..."
mkdir -p "$WIKI_DIR/raw"
mkdir -p "$WIKI_DIR/wiki/index"
mkdir -p "$WIKI_DIR/outputs/queries"
mkdir -p "$WIKI_DIR/outputs/reports"
mkdir -p "$WIKI_DIR/.cache"
echo "✅ 目录结构已创建"

# 4. 获取领域配置
echo ""
echo "4. 配置知识领域..."
echo "请定义你的知识领域（输入领域名称，用空格分隔）："
echo "示例：tech project learning"
read -p "领域列表: " DOMAINS

# 创建领域目录
for domain in $DOMAINS; do
    mkdir -p "$WIKI_DIR/raw/$domain"
    mkdir -p "$WIKI_DIR/wiki/$domain"
    echo "✅ 创建领域目录：$domain"
done

# 5. 复制配置文件
echo ""
echo "5. 复制配置文件..."

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

# 复制 purpose.md 模板
if [ -f "$PROJECT_DIR/templates/purpose-template.md" ]; then
    cp "$PROJECT_DIR/templates/purpose-template.md" "$WIKI_DIR/purpose.md"
    echo "✅ purpose.md 已复制"
fi

# 复制 Agent 配置模板
if [ -f "$PROJECT_DIR/config/templates/agent-config.md" ]; then
    echo ""
    echo "Agent 配置："
    echo "  配置模板位于：$PROJECT_DIR/config/templates/agent-config.md"
    echo "  请将此文件复制到你的 Agent 配置目录："
    echo "  - WorkBuddy: ~/.workbuddy/CLAUDE.md"
    echo "  - Codex: ~/.codex/AGENTS.md"
    echo "  - Claude Code: ~/.claude/CLAUDE.md"
fi

# 6. 初始化 Git 仓库
echo ""
echo "6. 初始化 Git 仓库..."
cd "$WIKI_DIR"
if [ -d ".git" ]; then
    echo "⚠️ Git 仓库已存在"
else
    git init
    git add .
    git commit -m "Initial commit: Karpathy Wiki Automation"
    echo "✅ Git 仓库已初始化"
fi

# 7. 完成
echo ""
echo "=========================================="
echo "初始化完成！"
echo "=========================================="
echo ""
echo "知识库路径：$WIKI_DIR"
echo "已配置领域：$DOMAINS"
echo ""
echo "下一步："
echo "1. 编辑 $WIKI_DIR/purpose.md 定义知识库目标"
echo "2. 将 config/templates/agent-config.md 复制到你的 Agent 配置目录"
echo "3. 在 Agent 中 cd $WIKI_DIR"
echo "4. 开始自然对话，Agent 会自动采集知识"
echo ""
echo "更多信息请查看 README.md"
