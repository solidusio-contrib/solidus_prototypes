module SolidusPrototype
  module PrototypeProductManagementPermissionConcern
    def activate!
      can :manage, Spree::Prototype
      super
    end
  end
end
