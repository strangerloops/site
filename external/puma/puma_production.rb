#!/usr/bin/env puma

directory '/home/ubuntu/apps/site/current'
rackup "/home/ubuntu/apps/site/current/config.ru"
environment 'production'

pidfile "/home/ubuntu/apps/site/shared/tmp/pids/puma.pid"
state_path "/home/ubuntu/apps/site/shared/tmp/pids/puma.state"
stdout_redirect '/home/ubuntu/apps/site/shared/log/puma_error.log', '/home/ubuntu/apps/site/shared/log/puma_access.log', true

threads 0,8

bind 'unix:///home/ubuntu/apps/site/shared/tmp/sockets/site-puma.sock'

workers 0

prune_bundler

on_restart do
  puts 'Refreshing Gemfile'
  ENV["BUNDLE_GEMFILE"] = "/home/ubuntu/apps/site/current/Gemfile"
end