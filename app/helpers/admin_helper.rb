module AdminHelper

  def organics_for(current_retailer)
    current_retailer.first.items.select do |item| item.tags.include?('organic') ||
                                                  item.tags.include?("Organic")
    end
  end

  def find_price_variances_for(current_retailer)
    high_list = []; low_list = []

    # item_count = Item.count

    # highest = RetailerItemPrice.group(:item_id, :id).order(price: :desc).limit(item_count)
    # highest.each do |row|
    #   high_list << row.item if row.item && row.retailer_id == current_retailer.first.id
    #   break if high_list.count <= 30
    # end

    # lowest = RetailerItemPrice.group(:item_id, :id).order(:price).limit(item_count)
    # lowest.each do |row|
    #   low_list << row.item if row.item && row.retailer_id == current_retailer.first.id
    #   break if low_list.count <= 30
    # end


    # current_retailer.first.items.each do |item| # this block works but is slow, will work on using db

    #   highest = RetailerItemPrice.where(item_id: item.id).order(:price).last
    #   lowest = RetailerItemPrice.where(item_id: item.id).order(:price).first

    #   high_list << item if highest.retailer_id == current_retailer.first.id
    #   low_list << item if lowest.retailer_id == current_retailer.first.id
    # end
    [high_list, low_list]
  end
end
