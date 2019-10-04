source 'https://rubygems.org'

branch = ENV.fetch('SOLIDUS_BRANCH', 'master')
gem 'solidus', git: 'https://github.com/solidusio/solidus.git', branch: branch
gem 'solidus_auth_devise'

if ENV['DB'] == 'mysql'
  gem 'mysql2'
else
  gem 'pg', '~> 0.21'
end

group :test do
  if branch < "v2.5"
    gem 'factory_bot', '5.1.1'
  else
    gem 'factory_bot', '5.1.1'
  end
end

gemspec
