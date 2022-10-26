class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def respond_with(resource, _options = {})
    if resource.persisted?
      render json: { status: { code: 201, message: 'Signed up successfully.', data: user_to_json(resource) } },
             status: :created
    else
      render json: { status: { message: 'User Could not be created.', errors: resource.errors.full_messages } },
             status: :unprocessable_entity
    end
  end
end
