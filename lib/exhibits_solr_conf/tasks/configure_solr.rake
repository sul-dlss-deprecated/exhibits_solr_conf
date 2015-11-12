DEFAULT_SOLR_CONF_DIR = 'jetty/solr/blacklight-core/conf/'

namespace :exhibits do
  desc 'Copies exhibits Solr config files to Solr in testing server'
  task :configure_solr, :solr_conf_dir do |_task, args|
    args.with_defaults solr_conf_dir: DEFAULT_SOLR_CONF_DIR
    solr_conf_dir_path = File.expand_path(File.join(File.dirname(__FILE__), '/../../../solr_conf_4_testing'))
    Dir["#{solr_conf_dir_path}/*"].each do |fname|
      cp(fname, args.solr_conf_dir, verbose: true)
    end
  end
end
