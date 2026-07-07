# frozen_string_literal: true

module SolidusPrototypes
  module Spree
    module PermissionSets
      module ProductDisplayPatch

        def activate!
          super
          can [:display, :admin], ::Spree::Prototype
        end

        ::Spree::PermissionSets::ProductDisplay.prepend self
      end
    end
  end
end


