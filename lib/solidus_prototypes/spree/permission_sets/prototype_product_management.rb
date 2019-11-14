# frozen_string_literal: true

module Spree
  module PermissionSets
    # Adds all product display permissions, with addition
    # permissions for Spree::Prototype
    #
    # @example Adding product (with prototype) management to customer service users.
    # Spree::RoleConfiguration.configure do |config|
    #     config.assign_permissions :customer_service, [
    #       Spree::PermissionSets::PrototypeProductManagement
    #     ]
    #   end
    class PrototypeProductManagement < PermissionSets::ProductManagement
      def activate!
        can :manage, Spree::Prototype
        super
      end
    end
  end
end
