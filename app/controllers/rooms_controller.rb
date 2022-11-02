class RoomController < ApplicationController
    # before_action :authenticate_user!
    # before_action :query_resesrvation, except: :mine
    def room_list
      @room = Room.select('id, name')
      render json: { rooms: @room }, status: :ok
    end

end
  