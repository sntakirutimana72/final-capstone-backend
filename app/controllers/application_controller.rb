class ApplicationController < ActionController::API
  before_action :permit_params

  private

  def permit_params
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username email password])
  end
end
