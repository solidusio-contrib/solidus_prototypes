# frozen_string_literal: true

module SolidusPrototypes
  module Spree
    module PermittedAttributesDecorator

      def self.prepended(base)
        base.class_eval do
          product_attributes << :prototype_id

          def self.product_attributes
            @@product_attributes
          end
        end
      end

      ::Spree::PermittedAttributes.prepend self
    end
  end
end
