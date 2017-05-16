source 'https://rubygems.org'

branch = ENV.fetch('SOLIDUS_BRANCH', 'master')
gem 'solidus', github: 'solidusio/solidus', branch: branch
gem 'rails', '< 5.1' # hack for broken bundler dependency resolution
gem 'solidus_auth_devise', '~> 1.0'

gem 'mysql2'
gem 'pg'

gemspec
