source 'https://rubygems.org'

branch = ENV.fetch('SOLIDUS_BRANCH', 'master')
gem 'rails', '< 5.1' # HACK: broken bundler dependency resolution
gem 'solidus', github: 'solidusio/solidus', branch: branch
gem 'solidus_auth_devise', '~> 1.0'

gem 'mysql2'
gem 'pg'

gemspec
