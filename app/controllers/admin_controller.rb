class AdminController < ApplicationController
  before_filter do
    redirect_to root_path unless current_user && user_is_admin?
  end

  def dashboard
   @store_count = current_stores.count
   @item_count = current_retailer.first.items.count
  end
end
