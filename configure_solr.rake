require 'open-uri'

DEFAULT_SOLR_CONF_DIR = 'jetty/solr/blacklight-core/conf/'
URL_PREFIX = 'https://raw.githubusercontent.com/sul-dlss/exhibits-solr-conf/master/solr_conf_4_testing/'

namespace :spotlight do
  desc 'gets Solr config files from exhibits-solr-conf for testing Solr Server'
  task :configure_solr, :solr_conf_dir do |_task, args|
    args.with_defaults solr_conf_dir: DEFAULT_SOLR_CONF_DIR
    file_names =
    [
      'schema.xml',
      'solrconfig.xml',
      'stopwords_punctuation.txt',
      'synonyms.txt',
      'synonyms_both_anchors.txt',
      'synonyms_left_anchor.txt',
      'synonyms_right_anchor.txt'
    ]
#    file_names.each do |fname|
    Dir['solr_conf_4_testing/*'].each do |fname|
      puts "downloading #{fname} from git repo sul-dlss/exhibits-solr-conf"
      begin
        open("#{URL_PREFIX}#{fname}") do |io|
          IO.copy_stream(io, "#{args.solr_conf_dir}#{fname}")
        end
      rescue => e
        abort "Unable to download #{fname} from #{URL_PREFIX}#{fname} #{e.message}"
      end
    end
  end
end
