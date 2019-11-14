# frozen_string_literal: true

module SolidusPrototypes
  module ProductsLoaderConcern
    extend ActiveSupport::Concern

    included do
      create.before :load_prototype
    end

    def load_prototype
      resource = :product
      return if params[resource][:prototype_id].blank?

      @prototype = Spree::Prototype.find(params[resource][:prototype_id])
    end
  end
end
