Deface::Override.new(
  virtual_path: "spree/admin/product_properties/index",
  name: "prototype_product_properties_form",
  insert_after: "[data-hook='add_product_properties']",
  disabled: false,
  text: "<div id='prototypes' data-hook></div>"
)
