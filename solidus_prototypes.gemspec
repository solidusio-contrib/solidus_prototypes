# frozen_string_literal: true

$:.push File.expand_path('lib', __dir__)
require 'solidus_prototypes/version'

Gem::Specification.new do |s|
  s.name        = 'solidus_prototypes'
  s.version     = SolidusPrototypes::VERSION
  s.summary     = 'Adds prototypes for solidus'
  s.description = 'Breaking out prototypes from solidus'
  s.license     = 'BSD-3-Clause'

  s.required_ruby_version = '~> 2.4'

  s.author    = 'Graeme Nathan'
  s.email     = 'graeme@stembolt.com'
  s.homepage  = 'https://github.com/gevann'

  s.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  s.test_files = Dir['spec/**/*']
  s.bindir = "exe"
  s.executables = s.files.grep(%r{^exe/}) { |f| File.basename(f) }
  s.require_paths = ["lib"]

  if s.respond_to?(:metadata)
    s.metadata["homepage_uri"] = s.homepage if s.homepage
    s.metadata["source_code_uri"] = s.homepage if s.homepage
  end

  s.add_dependency 'deface'
  s.add_dependency 'solidus_core', ['>= 2.1.0', '< 3']
  s.add_dependency 'solidus_support', '>= 0.4', '< 0.9'

  s.add_development_dependency 'solidus_dev_support'
end
