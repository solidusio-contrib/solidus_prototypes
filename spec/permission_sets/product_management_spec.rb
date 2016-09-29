require 'spec_helper'

describe Spree::PermissionSets::ProductManagement do
  let(:ability) { DummyAbility.new }

  subject { ability }

  context "when activated" do
    before do
      described_class.new(ability).activate!
    end

    it { is_expected.to be_able_to(:manage, Spree::Prototype) }
  end

  context "when not activated" do
    it { is_expected.not_to be_able_to(:manage, Spree::Prototype) }
  end
end
