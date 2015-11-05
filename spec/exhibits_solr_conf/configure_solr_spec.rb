require 'spec_helper'
require 'rake'
require 'hurley'
require 'jettywrapper'

describe 'exhibits namespace rake task' do
  before do
    load File.expand_path('../../../lib/exhibits_solr_conf/tasks/configure_solr.rake', __FILE__)
  end

  describe 'configure_solr' do
    it 'takes argument for the target solr conf dir' do
      target_dir = "#{File.dirname(__FILE__)}/../../tmp/solr/"
      FileUtils.remove_dir(target_dir) if Dir.exist?(target_dir)
      FileUtils.mkdir_p(target_dir)
      Rake::Task['exhibits:configure_solr'].reenable
      Rake.application.invoke_task "exhibits:configure_solr[#{target_dir}]"
      copied_files = Dir.entries(target_dir)
      expect(copied_files.size).to be > 5
      expect(copied_files).to include('schema.xml', 'solrconfig.xml', 'synonyms_both_anchors.txt')
    end

    it 'Solr has correct configs and responds to select' do
      ZIP_URL = 'https://github.com/projectblacklight/blacklight-jetty/archive/v4.10.4.zip'

      Rake::Task['jetty:clean'].reenable
      Rake.application.invoke_task 'jetty:clean'
      Rake::Task['exhibits:configure_solr'].reenable
      Rake.application.invoke_task 'exhibits:configure_solr'

      jetty_params = Jettywrapper.load_config
      jetty_params[:startup_wait] = 20
      Jettywrapper.wrap(jetty_params) do
        solr_client = Hurley::Client.new('http://127.0.0.1:8983/solr')
        # responds to select
        response = solr_client.get '/solr/blacklight-core/select?q=*:*'
        expect(response).to be_success
        # has correct config files
        response = solr_client.get '/solr/blacklight-core/admin/file?file=synonyms_left_anchor.txt'
        expect(response).to be_success
        response = solr_client.get '/solr/blacklight-core/admin/file?file=schema.xml'
        expect(response.body).to match(/Stanford Exhibits based on SearchWorks/m)
      end
    end
  end
end
