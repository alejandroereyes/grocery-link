class Api::LookupController < ApiController

  def categories
    if verify_client(tokens)
      @all_categories = Category.all
      render json: @all_categories
    else
      need_ids_error
    end
  end

  def retailers
    if verify_client(tokens)
      @all_retailers = Retailer.all
      render json: @all_retailers
    else
      need_ids_error
    end
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

  def tokens
    params.permit(:client_id, :secret_id)
  end
end
