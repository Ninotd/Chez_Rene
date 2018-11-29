class BookingsController < ApplicationController
  skip_after_action :verify_authorized, only: :update

  def index
  end

  def new
    @booking = Booking.new
    @gun = Gun.find(params[:gun_id])
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user_id = current_user[:id]
    @booking.gun_id = params[:gun_id]
    @gun = Gun.find(params[:gun_id])
    duration = (@booking.end_date - @booking.start_date).to_i + 1
    @booking.amount = duration * @gun.price
    authorize @booking

    if @booking.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    if params[:status] == "accept"
      booking = Booking.find(params[:id])
      booking.confirmed = "Acceptée"
      booking.save
    elsif params[:status] == "refuse"
      booking = Booking.find(params[:id])
      booking.confirmed = "Refusée"
      booking.save
    end
    redirect_to monprofil_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def update_params
    params.require(:booking).permit(:id)
  end
end
