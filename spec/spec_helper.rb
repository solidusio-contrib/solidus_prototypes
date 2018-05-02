require "simplecov"
SimpleCov.start "rails"

ENV["RAILS_ENV"] ||= "test"

require File.expand_path("../dummy/config/environment.rb", __FILE__)

require "solidus_support/extension/feature_helper"

require 'cancan/matchers'
require "spree/testing_support/authorization_helpers"

Dir[File.join(File.dirname(__FILE__), "support/**/*.rb")].each { |f| require f }

# Requires factories defined in lib/solidus_prototypes/factories.rb
require 'solidus_prototypes/factories'

Capybara.server = :webrick

RSpec.configure do |config|
  config.infer_spec_type_from_file_location!
  config.raise_errors_for_deprecations!

  config.example_status_persistence_file_path = "./spec/examples.txt"

  config.include BaseFeatureHelper, type: :feature
end
