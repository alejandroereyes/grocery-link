class Retailer < ActiveRecord::Base
  has_many :stores, dependent: :destroy
  has_many :retailer_users, dependent: :destroy
  has_many :users, through: :retailer_users
  has_many :retailer_item_prices, dependent: :destroy
  has_many :items, through: :retailer_item_prices
  has_many :prices, through: :retailer_item_prices, source: :retailer_item_prices

  def price_for(item)
    retailer_item_prices.where(item_id: item.id).first
  end

  def on_sale?(item)
    price_for(item).on_sale
  end
end
