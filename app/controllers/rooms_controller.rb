class RoomsController < ApplicationController

before_action :authenticate_user!

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)

    if @room.save
      render json: @room, status: :created, location: @room
    else
      render json: @room.errors, status: :unprocessable_entity
    end
  end


  private

  def room_params
      params.require(:room).permit(:name, :number_of_beds, :price, :description, :picture, :room_type_id, :user_id)
  end


end
