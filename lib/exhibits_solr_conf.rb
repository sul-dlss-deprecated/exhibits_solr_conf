require 'exhibits_solr_conf/version'

module ExhibitsSolrConf
  rake_file_path = File.join(File.dirname(__FILE__), 'exhibits_solr_conf/tasks/*.rake')
  Dir[File.expand_path(rake_file_path)].each { |ext| load ext } if defined?(Rake)
end
