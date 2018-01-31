require 'spec_helper'

describe Spree::Product, type: :model do
  context '#create with prototypes' do
    let!(:prototype) { create(:prototype) }
    let!(:product) { Spree::Product.new(name: "Foo", price: 1.99, shipping_category_id: create(:shipping_category).id) }

    before { product.prototype_id = prototype.id }

    context "when prototype is supplied" do
      it "should create properties based on the prototype" do
        product.save
        expect(product.properties.count).to eq(1)
      end
    end

    context "when prototype with option types is supplied" do
      def build_option_type_with_values(name, values)
        ot = create(:option_type, name: name)
        values.each do |val|
          ot.option_values.create(name: val.downcase, presentation: val)
        end
        ot
      end

      let(:prototype) do
        size = build_option_type_with_values("size", %w(Small Medium Large))
        create(:prototype, name: "Size", option_types: [size])
      end

      let(:option_values_hash) do
        hash = {}
        prototype.option_types.each do |i|
          hash[i.id.to_s] = i.option_value_ids
        end
        hash
      end

      it "should create option types based on the prototype" do
        product.save
        expect(product.option_type_ids.length).to eq(1)
        expect(product.option_type_ids).to eq(prototype.option_type_ids)
      end

      it "should create product option types based on the prototype" do
        product.save
        expect(product.product_option_types.pluck(:option_type_id)).to eq(prototype.option_type_ids)
      end

      it "should still create variants when option_values_hash is given but prototype id is nil" do
        product.option_values_hash = option_values_hash
        product.prototype_id = nil
        product.save
        expect(product.option_type_ids.length).to eq(1)
        expect(product.option_type_ids).to eq(prototype.option_type_ids)
        expect(product.variants.length).to eq(3)
      end

      it "should create variants from an option values hash with one option type" do
        product.option_values_hash = option_values_hash
        product.save
        expect(product.variants.length).to eq(3)
      end

      it "should create variants from an option values hash with multiple option types" do
        color = build_option_type_with_values("color", %w(Red Green Blue))
        logo  = build_option_type_with_values("logo", %w(Ruby Rails Nginx))
        option_values_hash[color.id.to_s] = color.option_value_ids
        option_values_hash[logo.id.to_s] = logo.option_value_ids
        product.option_values_hash = option_values_hash
        product.save
        product.reload
        expect(product.option_type_ids.length).to eq(3)
        expect(product.variants.length).to eq(27)
      end
    end
  end
end
