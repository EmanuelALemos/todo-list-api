set -o errexit

bundle install
bundle exec rails db:migrate
bundle exec rails assets:precompile
bundle exec rails assets:clean