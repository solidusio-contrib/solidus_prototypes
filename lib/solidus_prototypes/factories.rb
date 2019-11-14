# frozen_string_literal: true

require 'spree/testing_support/factories/property_factory'

FactoryBot.define do
  factory :prototype, class: 'Spree::Prototype' do
    name { 'Baseball Cap' }
    properties { [create(:property)] }
  end
end
