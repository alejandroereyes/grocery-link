class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :brand, null: false
      t.string :name, null: false
      t.string :category, null: false
      t.integer :category_id
      t.boolean :non_gmo, default: false
      t.boolean :organic, default: false
      t.integer :total_servings, null: false
      t.string :servings_unit, null: false
      t.string :upc

      t.timestamps null: false
    end
  end
end
