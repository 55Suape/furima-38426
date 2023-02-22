#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle exec rake assets:precompile
bundle exec rake assets:clean
bundle exec rake db:migrate
# 本番のデータベースをリセットする際には、上記bundle exec rake db:migrateをコメントアウト化し、以下の記述を表示させる
# 本番のデータベースリセットが完了したら、元に戻す
# DISABLE_DATABASE_ENVIRONMENT_CHECK=1 bundle exec rake db:migrate:reset