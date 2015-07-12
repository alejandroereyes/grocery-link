class Api::ProductsController < ApiController

  def products_by_name
    @products = Item.where("name LIKE ?", "%#{name_params[1]}%")
    if @products.first
      render json: @products
    else
      render json: { message: "No Products Found" , params: name_params}
    end
  end

  private
  def tokens
    params.permit(:client_id, :secret_id)
  end

  def name_params
    params.permit(:name).first
  end
end
