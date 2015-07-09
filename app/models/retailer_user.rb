class RetailerUser < ActiveRecord::Base
  belongs_to :retailer
  belongs_to :user
end
