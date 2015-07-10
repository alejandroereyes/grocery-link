class ItemHelp

  def self.save_price_n_link(retailer_id, item, params)
    price = Price.add_if_new(params)
    RetailerItemPrice.add_or_update(price.id, item, retailer_id)
  end
end
