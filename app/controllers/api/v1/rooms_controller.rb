class Api::V1::RoomsController < ApiController
  def index
    @rooms = Room.all
    render json: { rooms: @rooms.map { |room| room_to_json(room) } }, status: :ok
  end
end
