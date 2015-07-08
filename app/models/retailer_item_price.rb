class RetailerItemPrice < ActiveRecord::Base
  belongs_to :retailer
  belongs_to :item
  belongs_to :price
end
