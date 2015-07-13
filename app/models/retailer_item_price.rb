class RetailerItemPrice < ActiveRecord::Base
  belongs_to :retailer
  belongs_to :item

  def self.add_or_update(params, item, retailer_id)
    RetailerItemPrice.find_or_create_by(price: params['price'],
                                     retailer_id: retailer_id,
                                         item_id: item.id)
  end

  def self.lowest_price_for(item)
    find_item_n_order_by_price(item).first
  end

  def self.highest_price_for(item)
    find_item_n_order_by_price(item).last
  end

  def self.find_item_n_order_by_price(item)
    where(item_id: item.id).order(:price)
  end
end
