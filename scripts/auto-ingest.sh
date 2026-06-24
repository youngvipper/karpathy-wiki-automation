#!/bin/bash
# 自动采集脚本
# 监听 raw/ 目录变化，自动触发编译

WIKI_DIR="D:/Knowledge/MyWiki"
RAW_DIR="$WIKI_DIR/raw"

echo "启动自动采集监听..."
echo "监听目录：$RAW_DIR"
echo "按 Ctrl+C 停止"

# 使用 inotifywait 监听目录变化（Linux/Mac）
# Windows 可以使用 Python watchdog

while true; do
    # 检查是否有新文件
    NEW_FILES=$(find "$RAW_DIR" -name "*.md" -newer "$WIKI_DIR/.cache/last_check" 2>/dev/null)
    
    if [ -n "$NEW_FILES" ]; then
        echo "发现新文件："
        echo "$NEW_FILES"
        
        # 对每个新文件触发编译
        for file in $NEW_FILES; do
            echo "正在编译：$file"
            # 这里应该调用 /karpathy-wiki compile
            # 但由于是 bash 脚本，需要通过 Agent 触发
            echo "请在 Agent 中运行：/karpathy-wiki compile $file"
        done
        
        # 更新检查时间
        touch "$WIKI_DIR/.cache/last_check"
    fi
    
    # 等待 5 秒
    sleep 5
done
