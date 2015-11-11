require 'exhibits-solr-conf/version'

module ExhibitsSolrConf
  Dir[File.expand_path(File.join(File.dirname(__FILE__), 'exhibits-solr-conf/tasks/*.rake'))].each { |ext| load ext } if defined?(Rake)
end
