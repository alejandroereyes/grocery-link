class Retailer < ActiveRecord::Base
  has_many :stores, dependent: :destroy
  has_many :retailer_users, dependent: :destroy
  has_many :users, through: :retailer_users
  has_many :retailer_item_prices, dependent: :destroy
  has_many :items, through: :retailer_item_prices

end
