$:.unshift(File.expand_path("./lib", ENV['rvm_path']))
require 'rvm/capistrano'
require 'bundler/capistrano'

set :rvm_ruby_string, '1.9.3'
set :rvm_type, :user

set :domain, "colourful-code.ilstar.me"
set :application, "colourful_code"

set :deploy_to, "/home/ilstar/www/#{application}"
set :deploy_via, :remote_cache
 
set :user, "ilstar"
set :use_sudo, false

set :scm, :git
set :repository,  "git@github.com:ilstar/colour_code.git"
set :branch, 'master'
set :git_shallow_clone, 1
 
server domain, :app, :web, :db, :primary => true

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

namespace :deploy do
  def thin_file_path
    "#{release_path}/config/thin.yml"
  end

  def cmd_thin(sign)
    run "bundle exec thin -C #{thin_file_path} #{sign}"
  end

  task :start do
    cmd_thin 'start'
  end

  task :stop do
    cmd_thin 'stop'
  end

  task :restart do
    cmd_thin 'restart'
  end
end