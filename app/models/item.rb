class Item < ActiveRecord::Base
  has_many :retailer_item_prices
  has_many :retailers, through: :retailer_item_prices
  has_many :prices, through: :retailer_item_prices

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Item.create! row.to_hash
    end
  end
end
