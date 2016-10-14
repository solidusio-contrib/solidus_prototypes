module SolidusPrototypes
  module PrototypeProductDisplayPermissionConcern
    def activate!
      super
      can [:display, :admin], Spree::Prototype
    end
  end
end
