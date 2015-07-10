class Price < ActiveRecord::Base
  has_many :retailer_item_prices

  def self.add_if_new(params)
    Price.find_or_create_by(cost: params['price'])
  end
end
