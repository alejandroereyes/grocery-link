class ItemsController < ApplicationController

  def index
    retailer = Retailer.find(current_retailer_id)
    @items = retailer.items.paginate(:page => params[:page], :per_page => 30)
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def edit
    @item = Item.find(params[:id])
  end

  def import
    Item.import(params[:file])
    redirect_to :back, notice: "File imported."
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      price = Price.add_if_new(price_params)
      RetailerItemPrice.add_or_update(price.id, @item, current_retailer_id)
      redirect_to @item, notice: 'Item was successfully created.'
    else
      render :new
    end
  end

  def update
    if @item.update(item_params)
      redirect_to @item, notice: 'Item was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to items_url, notice: 'Item was successfully destroyed.'
  end

  private

    def item_params
      params.require(:item).permit(:brand, :name, :manufacturer, :category, :category_id, :ingredients, :description, :tags, :total_servings, :servings_unit, :weight, :upc)
    end

    def price_params
      params.require(:item).permit(:price)
    end
end
