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
        products_submenu = find ".selected .admin-subnav"

        within products_submenu do
          click_on "Prototypes"
        end

        within "#content-header" do
          expect(page).to have_text "Prototypes"
        end

        within products_submenu do
          expect(page).to have_text(
            %w{
              Products
              Option Types
              Property Types
              Taxonomies
              Display Order
              Prototypes
            }.join(" ")
          )
        end
      end
    end
  end
end
