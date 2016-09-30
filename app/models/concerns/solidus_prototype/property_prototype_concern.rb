module SolidusPrototype
  module PropertyPrototypeConcern
    extend ActiveSupport::Concern

    included do
      has_many :property_prototypes
      has_many :prototypes, through: :property_prototypes
    end
  end
end
