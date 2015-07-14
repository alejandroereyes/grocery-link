module AdminHelper

  def organics_for(current_retailer)
    current_retailer.first.items.select do |item| item.tags.include?('organic') ||
                                                  item.tags.include?("Organic")
    end
  end

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
