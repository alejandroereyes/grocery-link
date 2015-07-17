class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  require 'csv'
  helper_method :user_is_admin?, :current_retailer, :current_retailer_id

  def user_is_admin?
    @user_is_admin ||= current_user ? current_user.admin : false
  end

  def only_admins
    redirect_to root_path unless current_user && user_is_admin?
  end

  def current_retailer
    @current_retailer ||= current_user.retailer if current_user && current_user.retailer
  end

  def current_retailer_id
    @current_retailer_id = current_retailer.first.id
  end

  def current_stores
    @current_stores = current_retailer.first.stores
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
  end
end
