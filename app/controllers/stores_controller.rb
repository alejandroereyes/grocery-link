class StoresController < ApplicationController
  before_filter do
    redirect_to root_path unless current_user && user_is_admin?
  end

  def index
    @stores = Store.where(retailer_id: current_retailer_id)
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
  end

  def create
    @store = Store.new(store_params)
    @store.city = @store.city.downcase
    @store.retailer_id = current_retailer_id

    if @store.save
      redirect_to @store, notice: 'Store was successfully created.'
    else
      render :new
    end
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
end
