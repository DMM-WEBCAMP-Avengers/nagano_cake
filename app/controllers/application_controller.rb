class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :store_current_location, unless: :devise_controller?
  add_flash_types :success, :info, :warning, :danger

  protected
  #deviseのストロングパラメータ記述
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :kana_first_name, :kana_last_name, :postal_code, :address, :phone_number])
  end
  #フレンドリーフォワーディングの実装
  def store_current_location
    return if current_user
    store_location_for(:user, request.url)
  end

end
