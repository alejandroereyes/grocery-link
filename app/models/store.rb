class Store < ActiveRecord::Base
  belongs_to :retailer

  def self.found_for_city_from(params)
    Store.where(state: params['state'].upcase, city: params['city'].titleize).
          order(:retailer_id).group(:id, :retailer_id)
  end
end
