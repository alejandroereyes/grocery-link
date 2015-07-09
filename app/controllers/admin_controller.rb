class AdminController < ApplicationController

  def dashboard
    # @categories = im_lookup.lookup_get_categories
    # @categories.inspect
    @product = im_link.products_search_products(name: "Amy's", per_page: 50)
    render json: @product['result']
  end
end
