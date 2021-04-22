# frozen_string_literal: true

module SolidusPrototypes
  module Spree
    module PropertyDecorator

      def self.prepended(base)
        base.class_eval do
          has_many :property_prototypes
          has_many :prototypes, through: :property_prototypes
        end
      end

      ::Spree::Property.prepend self
    end
  end
end
