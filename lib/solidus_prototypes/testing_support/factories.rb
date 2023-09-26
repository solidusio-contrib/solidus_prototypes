# frozen_string_literal: true

FactoryBot.define do
  factory :prototype, class: 'Spree::Prototype' do
    name { 'Baseball Cap' }
    properties { [create(:property)] }
  end
end
