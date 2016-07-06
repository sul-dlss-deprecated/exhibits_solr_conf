require 'bundler/gem_tasks'

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

require 'rubocop/rake_task'
RuboCop::RakeTask.new(:rubocop)

desc 'run specs and rubocop'
task ci: [:spec, :rubocop]

task default: :ci

desc 'Run solr with the configuration loaded'
task :server do
  require 'solr_wrapper'
  require 'exhibits_solr_conf'

  SolrWrapper.wrap(port: '8983') do |solr|
    solr.with_collection(name: 'blacklight-core', dir: ExhibitsSolrConf.path) do
      loop do
        sleep 1
      end
    end
  end
end
