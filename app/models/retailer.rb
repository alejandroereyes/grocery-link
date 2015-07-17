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
    retailer_item_prices.where(item_id: item.id).first.on_sale
  end

  def self.all_organic_counts
    all.map do |retailer|
      { id: retailer.id, org_count: retailer.organics.count }
    end
  end

  def organics
    items.select do |item| item.tags.include?('organic') ||
                           item.tags.include?("Organic")
    end
  end
end
