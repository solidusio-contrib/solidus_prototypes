Rails.application.config.to_prepare do
  if Spree::PermittedAttributes.product_attributes.exclude?(:prototype_id)
    Spree::PermittedAttributes.product_attributes << :prototype_id
  end
  Spree::Backend::Config.configure do |config|
    product_tab = config.menu_items.detect { |menu_item|
      menu_item.label == :products
    }
    if product_tab.respond_to?(:children) && product_tab.children.none? { |c| c.label == :prototypes }
      product_tab.children << Spree::BackendConfiguration::MenuItem.new(
        condition: -> { can?(:admin, Spree::Prototype) },
        url: :admin_prototypes_path,
        label: :prototypes,
        match_path: '/prototypes'
      )
    else
      if product_tab.sections.exclude?(:prototypes)
        product_tab.sections << :prototypes
      end
    end
  end
end
