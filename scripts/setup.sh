#!/bin/bash
# 初始化脚本
# 用于快速设置知识管理系统

echo "=========================================="
echo "Karpathy Wiki 知识管理系统初始化"
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

# 2. 创建知识库目录
echo ""
echo "2. 创建知识库目录..."
WIKI_DIR="D:/Knowledge/MyWiki"

if [ -d "$WIKI_DIR" ]; then
    echo "⚠️ 知识库目录已存在：$WIKI_DIR"
else
    mkdir -p "$WIKI_DIR"
    echo "✅ 知识库目录已创建：$WIKI_DIR"
fi

# 3. 初始化目录结构
echo ""
echo "3. 初始化目录结构..."
mkdir -p "$WIKI_DIR/raw/quant"
mkdir -p "$WIKI_DIR/raw/gis"
mkdir -p "$WIKI_DIR/raw/office"
mkdir -p "$WIKI_DIR/wiki/quant"
mkdir -p "$WIKI_DIR/wiki/gis"
mkdir -p "$WIKI_DIR/wiki/office"
mkdir -p "$WIKI_DIR/wiki/index"
mkdir -p "$WIKI_DIR/outputs/queries"
mkdir -p "$WIKI_DIR/outputs/reports"
mkdir -p "$WIKI_DIR/.cache"
echo "✅ 目录结构已创建"

# 4. 复制配置文件
echo ""
echo "4. 复制配置文件..."

# WorkBuddy
if [ -f "config/workbuddy/CLAUDE.md" ]; then
    mkdir -p ~/.workbuddy
    cp config/workbuddy/CLAUDE.md ~/.workbuddy/
    echo "✅ WorkBuddy 配置已复制"
fi

# Codex
if [ -f "config/codex/AGENTS.md" ]; then
    mkdir -p ~/.codex
    cp config/codex/AGENTS.md ~/.codex/
    echo "✅ Codex 配置已复制"
fi

# Claude Code
if [ -f "config/claude-code/CLAUDE.md" ]; then
    mkdir -p ~/.claude
    cp config/claude-code/CLAUDE.md ~/.claude/
    echo "✅ Claude Code 配置已复制"
fi

# 5. 初始化 Git 仓库
echo ""
echo "5. 初始化 Git 仓库..."
cd "$WIKI_DIR"
if [ -d ".git" ]; then
    echo "⚠️ Git 仓库已存在"
else
    git init
    git add .
    git commit -m "Initial commit"
    echo "✅ Git 仓库已初始化"
fi

# 6. 完成
echo ""
echo "=========================================="
echo "初始化完成！"
echo "=========================================="
echo ""
echo "知识库路径：$WIKI_DIR"
echo ""
echo "下一步："
echo "1. 编辑 $WIKI_DIR/purpose.md 定义知识库目标"
echo "2. 在任意 Agent 中 cd $WIKI_DIR"
echo "3. 开始自然对话，Agent 会自动采集知识"
echo ""
echo "更多信息请查看 README.md"
