Deface::Override.new(
  virtual_path: "spree/admin/product_properties/index",
  name: "prototypes_product_properties_toolbar",
  insert_bottom: "ul.tollbar",
  disabled: false,
  partial: "spree/shared/prototypes_product_properties_toolbar"
)
