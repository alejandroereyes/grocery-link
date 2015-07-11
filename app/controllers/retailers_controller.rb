class RetailersController < ApplicationController
  before_filter do
    redirect_to root_path unless current_user && user_is_admin?
  end

  def index
    @retailers = Retailer.all
  end

  def show
    @retailer = current_retailer.first
  end

  def new
    @retailer = Retailer.new
  end

  def edit
    @retailer = current_retailer.first
  end

  def create
    @retailer = Retailer.new(retailer_params)

    if @retailer.save
      redirect_to @retailer, notice: 'Retailer was successfully created.'
    else
      render :new
    end
  end

  def update
    @retailer = current_retailer.first
    if @retailer.update(retailer_params)
      redirect_to @retailer, notice: 'Retailer was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @retailer = Retailer.find(params[:id])
    @retailer.destroy
    redirect_to retailers_url, notice: 'Retailer was successfully destroyed.'
  end

  private
    def retailer_params
      params.require(:retailer).permit(:name)
    end
end
