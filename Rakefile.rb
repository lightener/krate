require 'rspec/core/rake_task'
require 'FileUtils'

RSpec::Core::RakeTask.new('spec')

task :default => :spec