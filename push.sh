#!/bin/bash
# 一键推送HTML文件到 GitHub Pages
# 用法: bash push.sh file.html [自定义文件名.html]

set -e
cd "$(dirname "$0")"

FILE="$1"
OUTPUT_NAME="${2:-$(basename "$FILE")}"

if [ -z "$FILE" ]; then
    echo "用法: bash push.sh <html文件路径> [输出文件名]"
    exit 1
fi

if [ ! -f "$FILE" ]; then
    echo "错误: 文件不存在: $FILE"
    exit 1
fi

cp "$FILE" "$OUTPUT_NAME"
git add "$OUTPUT_NAME"
git commit -m "update: $OUTPUT_NAME" --allow-empty
git push origin main

echo "✅ 已推送! 预览地址: https://jbforrest.github.io/onion-html-pages/$OUTPUT_NAME"
