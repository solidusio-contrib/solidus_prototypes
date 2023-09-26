# frozen_string_literal: true

Deface::Override.new(
  virtual_path: "spree/admin/shared/_product_sub_menu",
  name: "prototypes_admin_tab",
  insert_bottom: "[data-hook='admin_product_sub_tabs']",
  text: "<%= tab :prototypes if can?(:admin, Spree::Prototype) %>"
)
