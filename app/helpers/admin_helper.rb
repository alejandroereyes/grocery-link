module AdminHelper
  def organics_for(current_retailer)
    current_retailer.first.items.select {|item| item.tags.include?('organic') ||
                                                item.tags.include?("Organic") }
  end
end
