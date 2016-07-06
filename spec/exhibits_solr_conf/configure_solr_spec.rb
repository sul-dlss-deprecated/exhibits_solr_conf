require 'spec_helper'
require 'faraday'
require 'solr_wrapper'

describe 'exhibits solr config' do
  it 'Solr has correct configs and responds to select' do
    SolrWrapper.wrap(port: '8983') do |solr|
      solr.with_collection(name: 'blacklight-core', dir: ExhibitsSolrConf.path) do
        solr_client = Faraday.new(url: 'http://127.0.0.1:8983/solr')
        # responds to select
        response = solr_client.get '/solr/blacklight-core/select?q=*:*'
        expect(response).to be_success
        # has correct config files
        response = solr_client.get '/solr/blacklight-core/admin/file?file=synonyms_left_anchor.txt'
        expect(response).to be_success
        response = solr_client.get '/solr/blacklight-core/admin/file?file=managed-schema'
        expect(response.body).to match(/Stanford Exhibits based on SearchWorks/m)
      end
    end
  end
end
