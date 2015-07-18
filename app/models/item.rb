class Item < ActiveRecord::Base
  has_many :retailer_item_prices
  has_many :retailers, through: :retailer_item_prices
  has_many :prices, through: :retailer_item_prices, source: :retailer_item_prices
  include PgSearch
  pg_search_scope :get_full_item_info, :against => :name, :using => [:tsearch]

  def find_all_retailers
    retailers.map{ |retailer| retailer.name }.uniq.
              map{ |name| Retailer.find_by(name: name) }.
              map{ |retailer| {id: retailer.id, name: retailer.name} }
  end
end
