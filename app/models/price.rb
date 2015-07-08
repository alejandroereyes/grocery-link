class Price < ActiveRecord::Base
  has_many :retailer_item_prices
end
