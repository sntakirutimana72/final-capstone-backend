class ApplicationController < ActionController::API
  before_action :permit_params, if: :devise_controller?
 
  private

  def permit_params
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password) }
  end

  def user_to_json(user)
    {
      username: user.username,
      email: user.email,
      role: user.role.name
    }
  end
end
