class Api::V1::RoomsController < ApiController
  before_action :set_room, only: %i[show update]
  def index
    # @rooms = current_user.rooms
    @rooms = Room.all
    render json: @rooms, status: :ok
  end

  def show
    render json: @room, status: :ok
  end

  def create
    @room = current_user.rooms.new(room_params)
    # @room = Room.new(room_params)
    if @room.save
      render json: @room, status: :created
    else
      render json: { data: @room.errors.full_messages, status: 'Failled' },
             status: :unprocessable_entity
    end
  end

  def update
    if @room.update(room_params)
        render json: { message: "Updated", data: @room }, status: :created
      else
        render json: { data: @room.errors.full_messages, status: 'Failled' },
               status: :unprocessable_entity
      end
  end

  def destroy
    @room = Room.find(params[:id])
    puts @room
    if @room.destroy
      render json: { data: 'Room deleted successfully', staus: "Deleted" }, status: :ok
    else
      render json: { data: 'Room not deleted', status: "Not deleted" }, status: :unprocessable_entity
    end
  end

  private

  def set_room
    @room = current_user.rooms.find(params[:id])
  # @room = Room.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    render json: { error: e.message }, status: :not_found
  end

  def room_params
    params.require(:room).permit(:name, :picture, :number_of_beds, :price, :description, :room_type_id,
                                 :user_id).with_defaults(user_id: current_user.id)
  end
end
