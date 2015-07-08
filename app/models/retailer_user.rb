class RetailerUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :retailer
end
