# frozen_string_literal: true

class CreatePrototypes < ActiveRecord::Migration[5.0]
  def change
    unless data_source_exists?("spree_prototypes")
      create_table :spree_prototypes do |t|
        t.string :name
        t.timestamps null: true
      end
    end

    unless data_source_exists?("spree_property_prototypes")
      create_table :spree_property_prototypes, id: false do |t|
        t.references :prototype
        t.references :property
        t.timestamps null: true
      end
    end

    unless data_source_exists?("spree_prototype_taxons")
      create_table :spree_prototype_taxons do |t|
        t.integer :taxon_id, index: true
        t.integer :prototype_id, index: true
        t.timestamps null: true
      end
    end

    unless data_source_exists?("spree_option_type_prototypes")
      create_table :spree_option_type_prototypes, id: false do |t|
        t.references :prototype
        t.references :option_type
        t.timestamps null: true
      end
    end
  end
end
