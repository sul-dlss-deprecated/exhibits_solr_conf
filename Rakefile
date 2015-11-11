require 'bundler/gem_tasks'

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

require 'rubocop/rake_task'
RuboCop::RakeTask.new(:rubocop)

desc 'run specs and rubocop'
task ci: [:spec, :rubocop]

task default: :ci

# the next 3 lines are useful for manual testing of THIS gem
require 'jettywrapper'
ZIP_URL = 'https://github.com/projectblacklight/blacklight-jetty/archive/v4.10.4.zip'
require 'exhibits-solr-conf'
