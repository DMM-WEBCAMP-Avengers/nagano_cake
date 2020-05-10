class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  add_flash_types :success, :info, :warning, :danger

  protected
  #deviseのストロングパラメータ記述
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :kana_first_name, :kana_last_name, :postal_code, :address, :phone_number])
  end

  def after_sign_in_path_for(resource)
    case resource
    when User
      root_path
    when AdminUser
      admin_path
    end
  end

end
