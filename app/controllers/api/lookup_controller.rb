class Api::LookupController < ApiController
  before_filter :verify_client

  def categories
    @all_categories = Category.all
    render json: @all_categories
  end

  def retailers
    @all_retailers = Retailer.all
    render json: @all_retailers
  end

  def retailers_in_area
    @area_stores = Store.found_for_city_from(store_params)
    if !(@area_stores.first)
      render json: { message: "No Stores Found in #{params['city']}, #{params['state']}" }
    end
  end

  private
  def store_params
    params.permit(:city, :state)
  end
end
