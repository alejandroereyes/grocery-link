class Api::ProductsController < ApiController
  before_filter :verify_client

  def products_by_name
    @products = Item.get_full_item_info(params[:name])
    if @products.first
      @products
    else
      not_found(params)
    end
  end

  def product_by_id
    begin
      @product = Item.find(id_params)
    rescue ActiveRecord::RecordNotFound => error
      not_found(params)
    end
  end

  private
  def name_params
    params.permit(:name).first
  end

  def id_params
    params.permit(:id).first[1]
  end
end
