# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  private

  def update_resource(resource, params)
    # current_password なしで更新できるようにする
    params.delete(:current_password)
    
    # email と password が空なら削除して更新
    params.delete(:email) if params[:email].blank?
    params.delete(:password) if params[:password].blank?
    params.delete(:password_confirmation) if params[:password_confirmation].blank?

    resource.update_without_password(params)
  end
end
