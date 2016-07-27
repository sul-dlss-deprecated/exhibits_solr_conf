[![Build Status](https://travis-ci.org/sul-dlss/exhibits_solr_conf.svg)](https://travis-ci.org/sul-dlss/exhibits_solr_conf) [![Gem Version](https://badge.fury.io/rb/exhibits_solr_conf.svg)](https://badge.fury.io/rb/exhibits_solr_conf)

# exhibits_solr_conf

Gem supplying a set of Solr config files and a rake task to use in *testing* sul-dlss exhibit and spotlight git repos, such as:

* sul_exhibits_templates
* spotlight-dor-resources
* exhibits_requests

Production Solr config files for exhibits are part of sul-solr-configs.

### Installation

Add this line to your engines's Gemfile:

    gem 'exhibits_solr_conf'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install exhibits_solr_conf

### Usage

With SolrWrapper, you can reference the solr configuration provided by this gem:

```ruby
task :ci do
  require 'solr_wrapper'
  require 'exhibits_solr_conf'
  ENV['environment'] = 'test'
  SolrWrapper.wrap(port: '8983') do |solr|
    solr.with_collection(name: 'blacklight-core', dir: ExhibitsSolrConf.path) do
      ...
    end
  end
end
```

## To update Solr configs for testing:

1. Clone this repo (```git clone git@github.com:sul-dlss/exhibits_solr_conf.git```)
2. Create your feature branch (```git checkout -b my-solr-config-tweaks```)
3. Commit your changes (```git commit -am 'Tweak solr configs thus'```)
4. Push to the branch (```git push origin my-solr-config-tweaks```)
5. Create a [Pull Request](https://help.github.com/articles/using-pull-requests/)

### To update Solr configs for deployment to production:

1. Ensure that all tests pass.
2. Clone the sul-solr-configs repo (```git clone git@github.com:sul-dlss/sul-solr-configs.git```)
3. Create feature branch (```git checkout -b exhibits-new-feature```)
4. Commit your changes (```git commit -am 'exhibits: add some new feature'```)
5. Push to the branch (```git push origin my-new-feature```)
6. Create a [Pull Request](https://help.github.com/articles/using-pull-requests/);  tag "@sul-dlss/devops" in your pull request comment.
