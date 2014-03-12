require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new('krate_spec.rb')

task :default => :spec