# frozen_string_literal: true


module SolidusPrototypes
  module Spree
    module Admin
      module ProductsControllerDecorator

      def self.prepended(base)
        base.create.before :load_prototype
      end

      private

      def load_prototype
        resource = :product
        return if params[resource][:prototype_id].blank?

        @prototype = Spree::Prototype.find(params[resource][:prototype_id])
      end

      ::Spree::Admin::ProductsController.prepend self if defined? ::Spree::Admin::ProductsController
    end
  end
end
