#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install

# 日本語フォントをインストール
apt-get update
apt-get install -y fonts-noto-cjk

bundle exec rake assets:precompile
bundle exec rake assets:clean
bundle exec rake db:migrate
# apt-get update && apt-get install -y wkhtmltopdf libxrender1 libxext6 libfontconfig1

set -e

# wkhtmltopdf-binary gemのインストール
echo "Installing wkhtmltopdf-binary..."
gem install wkhtmltopdf-binary

# 依存関係インストール
bundle install
yarn install --check-files