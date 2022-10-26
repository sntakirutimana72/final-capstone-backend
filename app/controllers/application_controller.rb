class ApplicationController < ActionController::API
  before_action :permit_params, if: :devise_controller?

  def permit_params
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password) }
  end
end
