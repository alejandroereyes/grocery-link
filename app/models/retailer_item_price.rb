class RetailerItemPrice < ActiveRecord::Base
  belongs_to :retailer
  belongs_to :item
  belongs_to :price

  def self.add_or_update(price_id, item, retailer_id)
    RetailerItemPrice.find_or_create_by(price_id: price_id,
                                     retailer_id: retailer_id,
                                         item_id: item.id)
  end
end
