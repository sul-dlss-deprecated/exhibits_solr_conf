# exhibits-solr-conf

A set of Solr config files to use in *testing* sul-dlss exhibit and spotlight git repos, such as:

* sul-exhibits-templates
* spotlight-dor-resources
* exhibits-requests

Production Solr config files for exhibits are part of sul-solr-configs.

### To update Solr configs for testing:

1. Clone this repo (```git clone git@github.com:sul-dlss/exhibits-solr-conf.git```)
2. Create your feature branch (```git checkout -b my-new-feature```)
3. Commit your changes (```git commit -am 'Add some feature'```)
4. Push to the branch (```git push origin my-new-feature```)
5. Create a [Pull Request](https://help.github.com/articles/using-pull-requests/)


### TODO:  We need a way to test these, and it should be between steps 2 and 3 above

1. Can we spin up empty Solr index with these configs?  (blacklight-jetty?)
2. Can we run tests cleanly for 
  * sul-exhibits-templates
  * spotlight-dor-resources
  * exhibits-requests
3. Can/should this be a travis build?


### To update Solr configs for deployment to production:

1. Ensure that all tests pass.
2. Clone the sul-solr-configs repo (```git clone git@github.com:sul-dlss/sul-solr-configs.git```)
3. Create feature branch (```git checkout -b exhibits-new-feature```)
4. Commit your changes (```git commit -am 'exhibits: add some new feature'```)
5. Push to the branch (```git push origin my-new-feature```)
6. Create a [Pull Request](https://help.github.com/articles/using-pull-requests/);  tag "@sul-dlss/devops" in your pull request comment.
