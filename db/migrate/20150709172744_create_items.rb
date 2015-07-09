class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :brand
      t.string :name
      t.string :manufacturer
      t.string :category
      t.integer :category_id
      t.text :ingredients
      t.text :description
      t.string :tags
      t.integer :total_servings
      t.string :servings_unit
      t.real :weight
      t.string :upc

      t.timestamps null: false
    end
  end
end
