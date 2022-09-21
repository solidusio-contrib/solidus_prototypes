# frozen_string_literal: true

Spree::Backend::Config.configure do |config|
  config.menu_items.detect { |menu_item|
    menu_item.label == :products
  }.sections << :prototypes
end

Deface::Override.new(
  virtual_path: "spree/admin/shared/_product_sub_menu",
  name: "prototypes_admin_tab",
  insert_bottom: "[data-hook='admin_product_sub_tabs']",
  text: "<%= tab :prototypes if can?(:admin, Spree::Prototype) %>"
)
