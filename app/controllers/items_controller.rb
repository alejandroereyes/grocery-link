class ItemsController < ApplicationController

  def index
    retailer = Retailer.find(current_retailer_id)
    @items = Item.all
  end

  def show
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def create
    @item = Item.new(item_params)

    if @item.save
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
end
