class AdminController < ApplicationController
  before_filter :only_admins

  def dashboard
    @store_count = current_stores.count
    @item_count = current_retailer.first.items.count
  end
end
