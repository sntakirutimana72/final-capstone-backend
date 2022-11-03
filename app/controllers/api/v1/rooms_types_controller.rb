class Api::V1::RoomsTypesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @rooms_types = RoomType.all
    render json: { rooms_types: @rooms_types.map { |type| room_type_to_json(type) } }, status: :ok
  end
end
