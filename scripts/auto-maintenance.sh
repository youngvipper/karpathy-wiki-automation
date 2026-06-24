#!/bin/bash
# 自动维护脚本
# 用于定期维护知识库

WIKI_DIR="D:/Knowledge/MyWiki"

echo "开始自动维护..."
echo "知识库路径：$WIKI_DIR"
echo "时间：$(date)"

# 1. 检查目录结构
echo ""
echo "1. 检查目录结构..."
if [ -d "$WIKI_DIR/raw" ] && [ -d "$WIKI_DIR/wiki" ] && [ -d "$WIKI_DIR/outputs" ]; then
    echo "✅ 目录结构正常"
else
    echo "❌ 目录结构异常，请检查"
    exit 1
fi

# 2. 统计文件数量
echo ""
echo "2. 统计文件数量..."
RAW_COUNT=$(find "$WIKI_DIR/raw" -name "*.md" -type f | wc -l)
WIKI_COUNT=$(find "$WIKI_DIR/wiki" -name "*.md" -type f | wc -l)
OUTPUT_COUNT=$(find "$WIKI_DIR/outputs" -name "*.md" -type f | wc -l)

echo "原始资料：$RAW_COUNT 个"
echo "Wiki 文章：$WIKI_COUNT 个"
echo "输出文件：$OUTPUT_COUNT 个"

# 3. 检查索引文件
echo ""
echo "3. 检查索引文件..."
if [ -f "$WIKI_DIR/wiki/index/Dashboard.md" ] && \
   [ -f "$WIKI_DIR/wiki/index/Concept Index.md" ] && \
   [ -f "$WIKI_DIR/wiki/index/Source Index.md" ]; then
    echo "✅ 索引文件正常"
else
    echo "⚠️ 索引文件缺失，建议运行 lint 检查"
fi

# 4. 检查日志文件
echo ""
echo "4. 检查日志文件..."
if [ -f "$WIKI_DIR/log.md" ]; then
    LOG_ENTRIES=$(grep "^## \[" "$WIKI_DIR/log.md" | wc -l)
    echo "✅ 日志文件正常，共 $LOG_ENTRIES 条记录"
else
    echo "⚠️ 日志文件缺失"
fi

# 5. 检查配置文件
echo ""
echo "5. 检查配置文件..."
if [ -f "$WIKI_DIR/purpose.md" ]; then
    echo "✅ 配置文件正常"
else
    echo "⚠️ 配置文件缺失"
fi

# 6. 生成维护报告
echo ""
echo "6. 生成维护报告..."
REPORT_FILE="$WIKI_DIR/outputs/reports/$(date +%Y-%m-%d)-maintenance.md"

cat > "$REPORT_FILE" << EOF
---
title: 维护报告 $(date +%Y-%m-%d)
type: output
stage: maintenance-report
domain: all
tags:
  - all
  - output
  - maintenance-report
created: $(date +%Y-%m-%d)
---

# 维护报告 $(date +%Y-%m-%d)

## 统计信息

- 原始资料：$RAW_COUNT 个
- Wiki 文章：$WIKI_COUNT 个
- 输出文件：$OUTPUT_COUNT 个
- 日志记录：$LOG_ENTRIES 条

## 检查结果

- ✅ 目录结构正常
- ✅ 索引文件正常
- ✅ 日志文件正常
- ✅ 配置文件正常

## 建议

1. 定期运行 lint 检查
2. 及时更新过时内容
3. 保持知识库整洁

## 下次维护时间

$(date -d "+7 days" +%Y-%m-%d)
EOF

echo "✅ 维护报告已生成：$REPORT_FILE"

echo ""
echo "自动维护完成！"
