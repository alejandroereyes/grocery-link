class AdminController < ApplicationController
  before_filter :only_admins

  def dashboard
    @store_count = current_stores.count
    @item_count = current_retailer.first.items.count
  end

  def high_list
    arr = []
    current_retailer.first.items.each do |item|
      found_item = RetailerItemPrice.highest_price_for(item)
      arr << item if found_item.retailer_id == current_retailer.first.id
      break if arr.size == 5
    end
    render json: arr
  end

  def low_list
     arr = []
    current_retailer.first.items.each do |item|
      found_item = RetailerItemPrice.lowest_price_for(item)
      arr << item if found_item.retailer_id == current_retailer.first.id
      break if arr.size == 5
    end
    render json: arr
  end
end
