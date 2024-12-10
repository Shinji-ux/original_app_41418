#!/usr/bin/env bash
# exit on error
set -o errexit

echo "Starting build process..."

# フォントディレクトリ作成とインストール
echo "Downloading and extracting fonts..."
mkdir -p /tmp/fonts
curl -L -o /tmp/fonts/NotoSansCJK.zip https://noto-website.storage.googleapis.com/pkgs/NotoSansCJK-Regular.ttc.zip || { echo "Font download failed"; exit 1; }
unzip /tmp/fonts/NotoSansCJK.zip -d /tmp/fonts || { echo "Font extraction failed"; exit 1; }

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