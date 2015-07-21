class StoresController < ApplicationController
  before_filter :only_admins

  def index
    stores = Store.where(retailer_id: current_retailer_id)
    @stores = stores.paginate(:page => params[:page], :per_page => 10)
  end

  def show
    store = Store.find(params[:id])
    if store.retailer_id = current_retailer_id
      @store = store
    else
      redirect_to :back, alert: "Access Denied"
    end
  end

  def new
    @store = Store.new
  end

  def edit
    @store = Store.find(params[:id])
  end

  def create
    if good_params?
      @store = Store.new(store_params)
      @store.city = @store.city.downcase
      @store.retailer_id = current_retailer_id
      if @store.save
        current_count = Store.count
        redirect_to @store, notice: 'Store was successfully created.'
      else
        render :new
      end
    else
      render :new, alert: 'Missing Field'
    end
    rescue StandardError => e
      redirect_to :back, alert: "Missing Field"
  end

  def update
    if @store.update(store_params)
      redirect_to @store, notice: 'Store was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @store.destroy
    redirect_to stores_url, notice: 'Store was successfully destroyed.'
  end

  private

  def store_params
    params.require(:store).permit(:store_id, :street, :city, :state, :zip)
  end

  def good_params?
    !(store_params.has_value?(""))
  end
end
