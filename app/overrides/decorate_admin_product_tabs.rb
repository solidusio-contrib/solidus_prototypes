Deface::Override.new(
  virtual_path: "spree/admin/shared/_product_sub_menu",
  name: "prototypes_product_tabs",
  insert_bottom: "[data-hook='admin_product_sub_tabs']",
  disabled: false,
  partial: "spree/shared/prototypes_products_sub_menu_tab"
)
