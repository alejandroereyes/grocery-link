class Api::ProductsController < ApiController

  def products_by_name
    # need 404 rescue, need verify tokens
    @products = Item.get_full_item_info(params[:name])
    if @products.first
      @products
    else
      not_found(params)
    end
  end

  def product_by_id
    if verify_client(tokens)
      @product = Item.find(id_params)
    else
      need_ids_error
    end
  end

  private
  def tokens
    params.permit(:client_id, :secret_id)
  end

  def name_params
    params.permit(:name).first
  end

  def id_params
    params.permit(:id).first[1]
  end
end
