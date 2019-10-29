$:.push File.expand_path('../lib', __FILE__)
require 'solidus_prototypes/version'

Gem::Specification.new do |s|
  s.name        = 'solidus_prototypes'
  s.version     = SolidusPrototypes::VERSION
  s.summary     = 'Adds prototypes for solidus'
  s.description = 'Breaking out prototypes from solidus'
  s.license     = 'BSD-3-Clause'

  s.author    = 'Graeme Nathan'
  s.email     = 'graeme@stembolt.com'
  s.homepage  = 'https://github.com/gevann'

  s.files = Dir["{app,config,db,lib}/**/*", 'LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'deface'
  s.add_dependency 'solidus_core', ['>= 2.1.0.alpha', '< 3']

  s.add_development_dependency 'capybara', '~> 2.18'
  s.add_development_dependency 'capybara-screenshot'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_bot'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'rubocop', '0.76.0'
  s.add_development_dependency 'rubocop-rspec', '~> 1.8'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'solidus_support'
  s.add_development_dependency 'sqlite3'
end
