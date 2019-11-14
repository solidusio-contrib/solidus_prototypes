# frozen_string_literal: true

module SolidusPrototypes
  module TaxonPrototypeConcern
    extend ActiveSupport::Concern

    included do
      has_many :prototype_taxons, dependent: :destroy
      has_many :prototypes, through: :prototype_taxons
    end
  end
end
