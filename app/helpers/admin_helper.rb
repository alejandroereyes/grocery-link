module AdminHelper

  def organics_for(current_retailer)
    current_retailer.first.items.select {|item| item.tags.include?('organic') ||
                                                item.tags.include?("Organic") }
  end

  def find_price_variances_for(current_retailer)
    high_list = []; low_list = []
    # look at current retailer item
    current_retailer.first.items.each do |item|
      current = RetailerItemPrice.where(item_id: item.id, retailer_id: current_retailer.first.id)
      all_others = RetailerItemPrice.where(item_id: item.id).where.not(retailer_id: current_retailer.first.id)
      all_others.each do |others_item|
        high_list << item if current_retailer.
      end
    end
    # compare to each other retialer item
    # if highest amongst others, save item in highlist as { item: item, var: var$ }
    # if lowest amongnst others, save item in lowlist as { item: item, var: var$ }
  end
end
