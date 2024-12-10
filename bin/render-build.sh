#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
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

curl -L -o NotoSansCJK.zip https://noto-website.storage.googleapis.com/pkgs/NotoSansCJK-Regular.ttc.zip
unzip NotoSansCJK.zip -d /app/bin/fonts