class ApplicationController < ActionController::API
  before_action :permit_params, if: :devise_controller?

  private

  def permit_params
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password) }
  end

  def respond_not_found
    render(json: { error: 'Not Found', status: 404 }, status: :not_found)
  end

  def respond_unprocessable(resource)
    render(
      json: { status: 422, error: resource.errors.objects.first.full_message },
      status: :unprocessable_entity
    )
  end
end
