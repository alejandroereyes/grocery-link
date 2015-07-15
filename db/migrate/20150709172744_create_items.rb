class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :product_id
      t.string :brand
      t.string :name
      t.string :manufacturer
      t.string :category
      t.integer :category_id
      t.text :ingredients
      t.text :description
      t.string :tags, array: true, default: []
      t.integer :total_servings
      t.string :servings_unit
      t.string :weight
      t.string :upc

      t.timestamps null: false
    end
  end
end
