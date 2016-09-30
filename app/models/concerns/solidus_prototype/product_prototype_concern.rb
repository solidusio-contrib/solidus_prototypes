  module SolidusPrototype
    module ProductPrototypeConcern
      extend ActiveSupport::Concern

      included do
        after_create :add_associations_from_prototype
        after_create :build_variants_from_option_values_hash, if: :option_values_hash

        # Overrides the prototype_id setter in order to ensure it is cast to an
        # integer.
        #
        # @param value [#to_i] the intended new value
        # @!attribute [rw] prototype_id
        #   @return [Fixnum]
        attr_reader :prototype_id
        attr_accessor :option_values_hash
      end

      def prototype_id=(value)
        @prototype_id = value.to_i
      end

      private

      def add_associations_from_prototype
        if prototype_id && prototype = Spree::Prototype.find_by(id: prototype_id)
          prototype.properties.each do |property|
            product_properties.create(property: property)
          end
          self.option_types = prototype.option_types
          self.taxons = prototype.taxons
        end
      end

      # Ensures option_types and product_option_types exist for keys in
      # option_values_hash.
      #
      # @return [Array] the option_values
      def ensure_option_types_exist_for_values_hash
        return if option_values_hash.nil?
        required_option_type_ids = self.option_values_hash.keys.map(&:to_i)
        self.option_type_ids |= required_option_type_ids
      end

      # Builds variants from a hash of option types & values
      def build_variants_from_option_values_hash
        ensure_option_types_exist_for_values_hash
        values = self.option_values_hash.values
        values = values.inject(values.shift) { |memo, value| memo.product(value).map(&:flatten) }

        values.each do |ids|
          variants.create(
            option_value_ids: ids,
            price: master.price
          )
        end
        save
      end

    end
  end
