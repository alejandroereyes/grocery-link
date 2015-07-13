class Api::ProductsController < ApiController

  def products_by_name
    # need 404 rescue, need verify tokens
    @products = Item.where("name LIKE ?", "%#{name_params[1]}%")
    if @products.first
      render json: @products
    else
      render json: { message: "No Products Found" , params: name_params}, status: 404
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
