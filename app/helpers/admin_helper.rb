module AdminHelper

  def organics_for(current_retailer)
    current_retailer.first.items.select {|item| item.tags.include?('organic') ||
                                                item.tags.include?("Organic") }
  end

  def find_price_variances_for(current_retailer)
    high_list = []; low_list = []

    current_retailer.first.items.each do |item|
      highest = RetailerItemPrice.where(item_id: item.id).order(:price).last
      lowest = RetailerItemPrice.where(item_id: item.id).order(:price).first

      high_list << item if item.retialer_id == highest.retialer_id
      low_list << item if item.retialer_id == highest.retialer_id
    end
    [high_list, low_list]
  end
end
