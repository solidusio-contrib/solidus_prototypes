# frozen_string_literal: true

module SolidusPrototypes
  module Spree
    module PermissionSets
      module ProductManagementDecorator

        def activate!
          can :manage, ::Spree::Prototype
          super
        end

        ::Spree::PermissionSets::ProductManagement.prepend self
      end
    end
  end
end
