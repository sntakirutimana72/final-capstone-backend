class Api::V1::ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[show update destroy]

  def index
  end
  # POST /api/v1/reservations
  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id
      if @reservation.save
      render json: @reservation, status: :created, data: @reservation
      else
      render json: @reservation.errors, status: :unprocessable_entity
      end
  end

  def show
  end

  private

  def set_reservation
    @reservation = current_user.reservations.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:from_date, :to_date, :room_id)
  end

end
