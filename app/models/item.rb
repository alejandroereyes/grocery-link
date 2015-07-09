class Item < ActiveRecord::Base
  has_many :retailer_item_prices
  has_many :retailers, through: :retailer_item_prices
  has_many :prices, through: :retailer_item_prices
end
