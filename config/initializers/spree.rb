Rails.application.config.to_prepare do
  Spree::PermittedAttributes.product_attributes << :prototype_id
  if defined?(Spree::Backend)
    Spree::Backend::Config.configure do |config|
      product_tab = config.menu_items.detect { |menu_item|
        menu_item.label == :products
      }
      if product_tab.respond_to?(:children)
        product_tab.children << Spree::BackendConfiguration::MenuItem.new(
          condition: -> { can?(:admin, Spree::Prototype) },
          url: :admin_prototypes_path,
          label: :prototypes,
          match_path: '/prototypes'
        )
      else
        product_tab.sections << :prototypes
      end
    end
  end
end
