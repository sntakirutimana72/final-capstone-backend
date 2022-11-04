class Api::V1::RoomsController < ApplicationController
  def new
    @room = Room.new
  end

  def index
    @rooms = Room.all
    render json: @rooms, status: :ok
  end

  def show
    @room = Room.find(params[:id])
    render json: @room, status: :ok
  end

  def create
    @room = Room.new(room_params)

    if @room.save
      facilities = Accomodation.where(id: acc_params[:accomodations])
      @room.accomodations.push(*facilities)
      render json: @room, status: :created
    else
      render json: @room.errors, status: :unprocessable_entity
    end
  end

  def dependencies
    types = ArraySerializer.new(RoomType.all, each_serializer: RoomTypeSerializer)
    accoms = ArraySerializer.new(Accomodation.all, each_serializer: AccomodationSerializer)
    render(json: { types:, accoms: })
  end

  def room_list
    @room = Room.select('id, name')
    render json: { rooms: @room }, status: :ok
  end

  private

  def acc_params
    params.require(:room).permit(accomodations: [])
  end

  def room_params
    params.require(:room).permit(:name, :number_of_beds, :price, :description, :picture,
                                 :room_type_id).merge(user: current_user)
  end
end
