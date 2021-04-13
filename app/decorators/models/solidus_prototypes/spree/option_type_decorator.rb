# frozen_string_literal: true

module SolidusPrototypes
  module Spree
    module OptionTypeDecorator

      def self.prepended(base)
        base.class_eval do
          has_many :option_type_prototypes
          has_many :prototypes, through: :option_type_prototypes
        end
      end

      ::Spree::OptionType.prepend self
    end
  end
end
