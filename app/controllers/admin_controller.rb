class AdminController < ApplicationController

  def dashboard
    @categories = im_lookup.lookup_get_categories
    # @product = im_link.products_search_products(name: "Amy's")
    @categories.inspect
  end
end
