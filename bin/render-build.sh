#!/usr/bin/env bash
# exit on error
set -o errexit

echo "Starting build process..."

# フォントディレクトリ作成
# echo "Creating font directory..."
# mkdir -p /opt/render/project/.fonts || { echo "Failed to create font directory"; exit 1; }

# NoToSansCJKのダウンロード
# echo "Downloading fonts..."
# curl -L -o /opt/render/project/.fonts/NotoSansCJK-Regular.ttc https://noto-website.storage.googleapis.com/pkgs/NotoSansCJK-Regular.ttc || { echo "Font download failed"; exit 1; }

# Node.js依存関係のインストール
echo "Installing Node.js dependencies..."
yarn install --check-files

# Ruby依存関係のインストール
echo "Installing Ruby dependencies..."
bundle install

# アセットの処理
echo "Precompiling and cleaning assets..."
bundle exec rake assets:precompile
bundle exec rake assets:clean

# データベースマイグレーション
echo "Running database migrations..."
bundle exec rake db:migrate

echo "Build process completed successfully."