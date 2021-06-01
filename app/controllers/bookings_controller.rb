class BookingsController < ApplicationController
  before_action :set_avenger, only: [:new, :create]
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.avenger = @avenger
    if @booking.save
      redirect_to avenger_path(@avenger)
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to_avengers_path
  end

  private
  def booking_params
    params.require(:booking).permit(:location, :start_time, :end_time)
  end

  def set_avenger
    @avenger = Avenger.find(params[:avenger_id])
  end
end
