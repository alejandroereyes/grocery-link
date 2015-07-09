class AdminController < ApplicationController
  before_filter do
    redirect_to root_path unless current_user && user_is_admin?
  end

  def dashboard
   @user = current_user
  end
end
