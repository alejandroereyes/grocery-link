class Api::ProductsController < ApiController

  def products_by_name
    @products = Item.where("name LIKE ?", "%#{name_params[1]}%")
    if @products.first
      render json: @products
    else
      render json: { message: "No Products Found" , params: name_params}
    end
  end

  def product_by_id
    @product = Item.find(id_params)
    # @product = @product.retailers
    # render json: @product
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
