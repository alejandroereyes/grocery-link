class ItemHelp

  def self.save_price_n_link(retailer_id, item, params)
    RetailerItemPrice.add_or_update(params, item, retailer_id)
    cat = Category.find(item.category_id)
    item.category = cat.name
    item.save
  end

  def self.help_csv_save(retailer_id, item, params, category)
    RetailerItemPrice.add_or_update(params, item, retailer_id)
    cat = Category.find_by(name: category)
    item.category_id = cat.id; item.category = cat.name
    item.save
  end
end
