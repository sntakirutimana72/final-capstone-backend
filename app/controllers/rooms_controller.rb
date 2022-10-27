class RoomsController < ApplicationController

    def new
        @room = Room.new
    end

    def create
        @user = current_user
        room = Room.new(params.require(:room).permit(:name, :number_of_beds, :price, :description))
        room.user_id = @user.id
        respond_to do |format|
          format.html do
            if room.save
              flash[:success] = 'Room created successfully'
              redirect_to user_rooms_path(@user)
            else
              flash.now[:error] = 'Error: Room could not be created'
              render :new, locals: { room: }
            end
          end
        end
    end
  
end