class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.integer :store_id
      t.belongs_to :retailer, index: true, foreign_key: true
      t.string :street
      t.string :city
      t.string :state
      t.integer :zip

      t.timestamps null: false
    end
  end
end
