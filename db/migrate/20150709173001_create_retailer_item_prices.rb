class CreateRetailerItemPrices < ActiveRecord::Migration
  def change
    create_table :retailer_item_prices do |t|
      t.belongs_to :retailer, index: true, foreign_key: true
      t.belongs_to :item, index: true, foreign_key: true
      t.belongs_to :price, index: true, foreign_key: true
      t.integer :product_id
      t.boolean :on_sale
      t.string :sale_price

      t.timestamps null: false
    end
  end
end
