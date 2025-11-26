#!/bin/bash
# 使用官方 Pub 源运行命令的辅助脚本

export PUB_HOSTED_URL="https://pub.dev"
export FLUTTER_STORAGE_BASE_URL="https://storage.googleapis.com"

echo "✅ 使用官方 Pub 源"
echo "PUB_HOSTED_URL=$PUB_HOSTED_URL"
echo ""

cd "$(dirname "$0")/.." || exit
fvm "$@"

