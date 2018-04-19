Spree::Backend::Config.configure do |config|
  config.menu_items << config.class::MenuItem.new(
    [:prototypes],
    'box',
    condition: -> { can?(:admin, Spree::Prototype) },
  )
end

