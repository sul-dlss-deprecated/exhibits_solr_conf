require 'exhibits_solr_conf/version'

module ExhibitsSolrConf
  def self.path
    File.expand_path(File.join(File.dirname(__FILE__), '..', 'solr_conf_4_testing'))
  end
end
