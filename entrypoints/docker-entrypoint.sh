#!/bin/sh

set -e

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

echo "Migrating data or creating database if not exists..."
bundle exec rails db:migrate 2>/dev/null || bundle exec rails db:setup

echo "Building Tailwind CSS..."
bundle exec rake tailwindcss:build

echo "Starting server..."
bundle exec rails s -b 0.0.0.0
