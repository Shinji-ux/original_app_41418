class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:company, :phone])
    devise_parameter_sanitizer.permit(:account_update, keys: [:phone, :company, :city, :address, :manager, :bank, :branch, :account_type, :number, :name])
  end
end
