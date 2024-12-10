#!/usr/bin/env bash
# exit on error
set -o errexit
apt-get update && apt-get install -y wkhtmltopdf libxrender1 libxext6 libfontconfig1

bundle install
bundle exec rake assets:precompile
bundle exec rake assets:clean
bundle exec rake db:migrate
