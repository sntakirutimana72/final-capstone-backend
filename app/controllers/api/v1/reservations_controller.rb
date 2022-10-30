class Reservations_controller < Application_controller
  def index
    @reservations = Reservations.all
    render json: @rooms, status: :ok
  end

  def show
    @reservation = @reservations.find(params[:room.id] == room_id)
    render json: @reservation, status
  end

end