require "bundler/capistrano"
load "config/recipes/base"
load "config/recipes/nginx"
load "config/recipes/unicorn"
load "config/recipes/mysql"

# load "config/recipes/postgresql"
load "config/recipes/nodejs"
load "config/recipes/rbenv"
load "config/recipes/check"
load "config/recipes/system_user"
set :bundle_flags,    ""

server "192.168.100.123", :web, :app, :db, primary: true

set :user, "deployer"
set :application, "coremetrics-logger"
set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false

set :scm, "git"
set :repository, "git@github.com:marchi-lau/#{application}.git"
set :branch, "master"
set :ssh_public_key, "/Users/Marchi/.ssh/id_rsa.pub" # this key will be enabled for login as deployer user

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

after "deploy", "deploy:cleanup" # keep only the last 5 releases
