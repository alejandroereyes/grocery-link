class RetailersController < ApplicationController

  def index
    @retailers = Retailer.all
  end

  def show
  end

  def new
    @retailer = Retailer.new
  end

  def edit
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
    if @retailer.update(retailer_params)
      redirect_to @retailer, notice: 'Retailer was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @retailer.destroy
    redirect_to retailers_url, notice: 'Retailer was successfully destroyed.'
  end

  private
    def retailer_params
      params.require(:retailer).permit(:name)
    end
end
