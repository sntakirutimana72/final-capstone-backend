
class Api::V1::RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @rooms = Room.all
    render json: @reservations, status: :ok
  end

  def show
    @room = Room.find(params[:id])
    render json: @room, status: :ok
  end

end