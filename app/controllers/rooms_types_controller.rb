class RoomsTypesController < ApplicationController
  def index
    @rooms_types = RoomType.all
    render json: { rooms_types: @rooms_types.map { |type| room_type_to_json(type) } }, status: :ok
  end
end
