class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :search
  before_action :get_current_user

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :age])
  end

  def search
    @q = Restaurant.ransack(params[:q])
  end

  def get_current_user
    @current_user = current_user if user_signed_in?
  end
end
