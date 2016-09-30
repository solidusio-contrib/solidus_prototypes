module Spree
  module Prototypes
    module PermittedAttributes
      extend ActiveSupport::Concern

      included do
        @@product_attributes << :prototype_id
      end
    end
  end
end

Spree::PermittedAttributes.include Spree::Prototype::PermittedAttributes
