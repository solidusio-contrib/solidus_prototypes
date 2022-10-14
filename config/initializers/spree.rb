Rails.application.config.to_prepare do
  Spree::PermittedAttributes.product_attributes << :prototype_id
end
