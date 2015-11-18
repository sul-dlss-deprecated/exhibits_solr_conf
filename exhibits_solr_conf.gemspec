# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'exhibits_solr_conf/version'

Gem::Specification.new do |spec|
  spec.name          = 'exhibits_solr_conf'
  spec.version       = ExhibitsSolrConf::VERSION
  spec.authors       = ['Naomi Dushay']
  spec.email         = ['ndushay@stanford.edu']
  spec.license       = 'Apache-2.0'

  spec.summary       = 'Solr config files for testing sul-dlss exhibit and spotlight git repos.'
  spec.description   = 'A set of Solr config files and a rake task for testing sul-dlss exhibit and spotlight git repos (sul_exhibits_templates, spotlight-dor-resources, exhibits_requests'
  spec.homepage      = 'https://github.com/sul-dlss/exhibits_solr_conf'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^spec/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'jettywrapper'
  spec.add_development_dependency 'hurley' # for http requests to Solr
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-rspec'
end
