module AdminHelper

  def organics_for(current_retailer)
    current_retailer.first.items.select do |item| item.tags.include?('organic') ||
                                                  item.tags.include?("Organic")
    end
  end

  # def find_price_variances_for(current_retailer)
  #   high_list = []; low_list = []

  #   current_retailer.first.items.each do |item|

  #     highest = RetailerItemPrice.highest_price_for(item)
  #     lowest = RetailerItemPrice.lowest_price_for(item)

  #     high_list << item if highest.retailer_id == current_retailer.first.id && high_list.size < 6
  #     low_list << item if lowest.retailer_id == current_retailer.first.id && low_list.size < 6

  #     break if low_list.size == 5 && high_list.size == 5
  #   end
  #   [high_list, low_list]
  # end

  def high_priced_items_for(current_retailer)
    arr = []
    current_retailer.first.items.each do |item|
      found_item = RetailerItemPrice.highest_price_for(item)
      arr << item if found_item.retailer_id == current_retailer.first.id
      break if arr.size == 5
    end
    arr
  end

  def low_priced_items_for(current_retailer)
     arr = []
    current_retailer.first.items.each do |item|
      found_item = RetailerItemPrice.lowest_price_for(item)
      arr << item if found_item.retailer_id == current_retailer.first.id
      break if arr.size == 5
    end
    arr
  end
end
