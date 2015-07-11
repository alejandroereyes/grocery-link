class Retailer < ActiveRecord::Base
  has_many :stores
  has_many :retailer_users
  has_many :users, through: :retailer_users
  has_many :retailer_item_prices
  has_many :items, through: :retailer_item_prices

end
