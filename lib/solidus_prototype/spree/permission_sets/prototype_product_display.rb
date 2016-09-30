module Spree
  module PermissionSets
    # Adds all product display permissions, with addition
    # permissions for Spree::Prototype
    #
    # @example Adding order, user, and product (with prototype) display to customer service users.
    # Spree::RoleConfiguration.configure do |config|
    #     config.assign_permissions :customer_service, [
    #       Spree::PermissionSets::OrderDisplay,
    #       Spree::PermissionSets::UserDisplay,
    #       Spree::PermissionSets::PrototypeProductDisplay
    #     ]
    #   end
    class PrototypeProductDisplay < PermissionSets::ProductDisplay
      def activate!
        can [:display, :admin], Spree::Prototype
        super
      end
    end
  end
end
