Deface::Override.new(
  virtual_path: "spree/admin/products/new",
  name: "prototypes_admin_products_new",
  insert_before: "[data-hook='new_product_price']",
  disabled: false,
  partial: "spree/admin/prototypes/products_new"
)

Deface::Override.new(
  virtual_path: "spree/admin/products/new",
  name: "prototypes_admin_products_new_clearfix",
  insert_after: "[data-hook='new_product_tax_category']",
  disabled: false,
  partial: "spree/admin/prototypes/products_new_clearfix"
)
