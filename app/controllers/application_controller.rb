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

  def room_to_json(room)
    {
      id: room.id,
      name: room.name,
      number_of_beds: room.number_of_beds,
      price: room.price,
      picture: room.picture,
      description: room.description,
      room_type: room.room_type.name
    }
  end

  def room_type_to_json(room_type)
    {
      id: room_type.id,
      name: room_type.name
    }
  end
end
