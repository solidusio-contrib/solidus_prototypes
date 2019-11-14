# frozen_string_literal: true

require 'spec_helper'

describe "Homepage with prototypes extension", type: :feature do
  context 'as admin user' do
    stub_authorization!

    context "visiting the products tab" do
      before do
        visit spree.admin_products_path
      end

      it "has a link to prototypes" do
        within('.selected .admin-subnav') { page.find_link("Prototypes")['/admin/prototypes'] }
      end
    end
  end
end
