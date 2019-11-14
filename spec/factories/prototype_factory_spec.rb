# frozen_string_literal: true

require 'spec_helper'
RSpec.describe 'prototype factory' do
  let(:factory_class) { Spree::Prototype }

  describe 'plain prototype' do
    let(:factory) { :prototype }

    it_behaves_like 'a working factory'
  end
end
