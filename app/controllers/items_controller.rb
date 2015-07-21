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
    old_count = Item.count
    @item = Item.new(item_params)
    if @item.save
      new_count = Item.count
      var_count = new_count - old_count
      ItemHelp.save_price_n_link(current_retailer_id, @item, price_params)
      redirect_to @item, notice: "#{var_count} item was successfully created."
    else
      render :new
    end
  end

  def csv_new_items
    old_count = Item.count
    begin
      CSV.foreach(params['file'].path, headers: true) do |row|
        if row['name'] && row['price']
          @item = Item.new
          ['name', 'brand', 'ingredients', 'description', 'total_servings',
           'tags', 'servings_unit', 'weight', 'upc', 'manufacturer'].each do |key|
            if key == 'tags'
              @item.update_attribute :tags, row['tags'].split(',')
            else
              @item[key.to_sym] = row[key]
            end
            @item.save
          end
          @category = row['category'].titleize
          ItemHelp.help_csv_save(current_retailer_id, @item, {'price'=> row['price'], 'product_id'=> row['product_id']}, @category)
        end
      end
      new_count = Item.count
      var_count = new_count - old_count
      redirect_to :dashboard, notice: "File upload Succesful. #{var_count} items added"
    rescue StandardError => e
      redirect_to :back, alert: "CSV could not be processed"
    end
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
      params.require(:item).permit(:price, :product_id,)
    end
end
