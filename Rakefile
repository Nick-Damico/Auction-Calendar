require_relative './config/environment'
require 'sinatra/activerecord/rake'

task console: :setup_env do
  Pry.start
end

namespace :db do
  task load_config: :setup_env do
    require_all 'app'
  end
end

task :setup_env do
  ENV['SINATRA_ENV'] ||= 'development'
end

begin
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new(:spec)

  task default: :spec
rescue LoadError
  # no rspec available in production like environments
end
