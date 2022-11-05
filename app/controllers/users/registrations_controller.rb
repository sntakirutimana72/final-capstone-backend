class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  protected

  def sign_up(_, resource)
    super(resource, store: false)
  end

  private

  def respond_with(resource, _options = {})
    return respond_unprocessable(resource) unless resource.persisted?

    render(
      json: {
        status: 201,
        message: 'Signed up successfully.', user: UserSerializer.new(resource)
      },
      status: :created
    )
  end
end
