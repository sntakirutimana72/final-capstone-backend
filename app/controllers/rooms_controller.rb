class RoomsController < ApplicationController
  # before_action :authenticate_user!

  def new
    @room = Room.new
  end

  def index
    render json: Room.all
  end

  def create
    @room = Room.new(room_params)

    if @room.save

      list = Accomodation.where(id: accomodation_params)
      @room.accomodations.push(*list)

      render json: @room, status: :created, location: @room
    else
      render json: @room.errors, status: :unprocessable_entity
    end
  end

  private

  def accomodation_params
    params.require(:room).permit(accomodation: [])
  end

  def room_params
    params.require(:room).permit(:name, :number_of_beds, :price, :description, :picture,
                                 :room_type_id).with_defaults(user_id: current_user.id)
  end
end
