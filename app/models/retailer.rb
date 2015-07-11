class Retailer < ActiveRecord::Base
  has_many :stores
  has_many :retailer_users
  has_many :users, through: :retailer_users
  has_many :retailer_item_prices
  has_many :items, through: :retailer_item_prices

  def self.all_organic_items(current_retailer)
    current_retailer.items.select {|item| item.tags.includes?('organic') || item.tags.includes?("Organic") }
  end
end
