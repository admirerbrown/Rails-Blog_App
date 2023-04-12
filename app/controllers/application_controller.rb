class ApplicationController < ActionController::Base
  include Pagy::Backend
  def current_user
    @current_user ||= User.first
  end
  helper_method :current_user
end
