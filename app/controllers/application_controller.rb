class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def im_link
    connection = InformationMachineApi::ProductsController.new ENV['client_id'], ENV['client_secret']
  end

  def im_lookup
    connect = InformationMachineApi::LookupController.new ENV['client_id'], ENV['client_secret']
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
  end
end
