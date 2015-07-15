class ItemsController < ApplicationController
  before_filter :only_admins

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

  def create
    @item = Item.new(item_params)
    if @item.save
      ItemHelp.save_price_n_link(current_retailer_id, @item, price_params)
      redirect_to @item, notice: 'Item was successfully created.'
    else
      render :new
    end
  end

  def csv_new_items
    CSV.foreach(params['file'].path, headers: true) do |row|
      if row['name'] && row['price']
        @item = Item.new
        @item.name = row['name']; @item.brand = row['brand']
        @item.ingredients = row['ingredients']; @item.description = row['description']
        @item.tags = row['tags']; @item.total_servings = row['total_servings']
        @item.servings_unit = row['servings_unit']; @item.weight = row['weight']
        @item.upc = row['upc']; @item.price = row['price']; @item.manufacturer = row['manufacturer']
        @item.save
        @category = row['category'].titleize
        ItemHelp.help_csv_save(current_retailer_id, @item, {'price'=> @item.price}, @category)
      end
    end
    redirect_to :dashboard, notice: "File upload Succesful"
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to @item, notice: 'Item was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_url, notice: 'Item was successfully destroyed.'
  end

  private
    def item_params
      params.require(:item).permit(:brand, :name, :manufacturer, :category_id,
        :ingredients, :description, :tags, :total_servings, :servings_unit, :weight, :upc)
    end

    def price_params
      params.require(:item).permit(:price)
    end
end
