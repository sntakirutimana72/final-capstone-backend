class ApiController < ApplicationController
  # --------------------------------------------------------------------------
  # |  Uncomment this line if when you have a function authentication system |
  # --------------------------------------------------------------------------

  # before_action :authenticate_user!

  private

  def room_to_json(room)
    {
      id: room.id,
      name: room.name,
      picture: room.picture,
      number_of_beds: room.number_of_beds,
      price: room.price,
      description: room.description,
      room_type: room.room_type.name
    }
  end
end
