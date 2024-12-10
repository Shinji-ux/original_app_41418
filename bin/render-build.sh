#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle exec rake assets:precompile
bundle exec rake assets:clean
bundle exec rake db:migrate
# apt-get update && apt-get install -y wkhtmltopdf libxrender1 libxext6 libfontconfig1

set -e

echo "Installing dependencies..."
bundle install
yarn install --check-files

echo "Installing wkhtmltopdf..."
curl -L -o wkhtmltox.deb https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox_0.12.6-1.bionic_amd64.deb

# 一時ディレクトリを指定して解凍
dpkg --path-exclude=/tmp --path-include=/tmp dpkg -x wkhtmltox.deb /app/bin/wkhtmltopdf

# wkhtmltopdfのインストールパスを環境変数PATHに追加
echo 'export PATH=$PATH:/app/bin/wkhtmltopdf/usr/local/bin' >> ~/.bashrc
source ~/.bashrc

rm wkhtmltox.deb