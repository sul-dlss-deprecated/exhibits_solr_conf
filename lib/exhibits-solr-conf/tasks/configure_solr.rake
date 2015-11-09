DEFAULT_SOLR_CONF_DIR = 'jetty/solr/blacklight-core/conf/'

namespace :exhibits do
  desc 'Copies exhibits Solr config files to Solr in testing server'
  task :configure_solr, :solr_conf_dir do |_task, args|
    args.with_defaults solr_conf_dir: DEFAULT_SOLR_CONF_DIR
    Dir['solr_conf_4_testing/*'].each do |fname|
      cp(fname, args.solr_conf_dir, verbose: true)
    end
  end
end
