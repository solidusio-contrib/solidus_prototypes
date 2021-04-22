# frozen_string_literal: true

module SolidusPrototypes
  module Spree
    module TaxonDecorator

      def self.prepended(base)
        base.class_eval do
          has_many :prototype_taxons, dependent: :destroy
          has_many :prototypes, through: :prototype_taxons
        end
      end

      ::Spree::Taxon.prepend self
    end
  end
end
