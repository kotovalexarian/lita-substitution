require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task default: [:spec, :lint]

task lint: [:rubocop]

require 'rubocop/rake_task'
RuboCop::RakeTask.new
