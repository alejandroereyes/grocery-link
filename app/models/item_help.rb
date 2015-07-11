class ItemHelp

  def self.save_price_n_link(retailer_id, item, params)
    RetailerItemPrice.add_or_update(params, item, retailer_id)
  end
end
