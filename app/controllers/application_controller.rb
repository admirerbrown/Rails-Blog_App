class ApplicationController < ActionController::Base
  include Pagy::Backend
  protect_from_forgery with: :exception
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  helper_method :current_user
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name bio photo])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name bio photo])
  end
  def after_sign_in_path_for(_resource)
    users_path
  end
  def after_sign_up_path_for(_resource)
    users_path
  end

end
