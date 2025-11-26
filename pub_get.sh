#!/bin/bash
# 快速运行 pub get 的脚本（使用官方源）

export PUB_HOSTED_URL="https://pub.dev"
export FLUTTER_STORAGE_BASE_URL="https://storage.googleapis.com"

echo "📦 使用官方 Pub 源获取依赖..."
echo "PUB_HOSTED_URL=$PUB_HOSTED_URL"
echo ""

cd "$(dirname "$0")" || exit

# 主项目
echo "🔹 主项目: pithy_dart"
fvm flutter pub get

# Example 项目
if [ -d "example" ]; then
    echo ""
    echo "🔹 Example 项目"
    cd example || exit
    fvm flutter pub get
fi

echo ""
echo "✅ 完成！"

