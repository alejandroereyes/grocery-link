class AdminController < ApplicationController
  before_filter :only_admins

  def dashboard
    @store_count = current_stores.count
    @item_count = current_retailer.first.items.count
    @organics_count = current_retailer.first.organics.count
    @organics_mix = (@organics_count.to_f/@item_count.to_f).round(2)
  end

  def high_list
    arr = get_records do |item|
      RetailerItemPrice.highest_price_for(item)
    end
    render json: arr
  end

  def low_list
    arr = get_records do |item|
      RetailerItemPrice.lowest_price_for(item)
    end
    render json: arr
  end

  private
  def get_records(&block)
    arr = []
      current_retailer.first.items.each do |item|
        found_item = block.call(item)
        arr << item if found_item.retailer_id == current_retailer.first.id
        break if arr.size == 5
      end
    arr
  end
end
