class Users::SessionsController < Devise::SessionsController
  before_action :authenticate_user!, only: %i[destroy logged_user]

  respond_to :json

  def logged_user
    render json: current_user, status: :ok
  end

  def destroy
    @logged_out_user = current_user
    super
  end

  private

  def verify_signed_out_user; end

  def respond_with(_resource, _options = {})
    render(
      json: {
        status: 200,
        message: 'User logged in successfully.',
        user: UserSerializer.new(current_user)
      },
      status: :ok
    )
  end

  def respond_to_on_destroy
    if @logged_out_user
      render json: {
        status: 200,
        message: 'User logged out successfully.'
      }, status: :ok
    else
      render json: {
        status: 401,
        message: 'User has no active session.'
      }, status: :unauthorized
    end
  end
end
