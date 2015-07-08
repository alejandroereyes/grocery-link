class CreateRetailerUsers < ActiveRecord::Migration
  def change
    create_table :retailer_users do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :retailer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
