class AvengersController < ApplicationController
  before_action :set_avenger, only: [:show, :edit, :update, :destroy]
  def index
    @avengers = Avenger.all

    @markers = @avengers.geocoded.map do |avenger|
      {
        lat: avenger.latitude,
        lng: avenger.longitude,
        info_window: render_to_string(partial: "info_window", locals: { avenger: avenger }),
        image_url: helpers.asset_url('avenger_logo.png')
      }
    end
  end

  def show
    @avengers = Avenger.all
    @avenger = Avenger.find(params[:id])
    @booking = Booking.new
    @review = Review.new
    @reviews = Review.where(avenger_id: @avenger.id)
    if user_signed_in?
      @booked_by_user = Booking.exists?(user: current_user, avenger: @avenger)
    else
      @booked_by_user = false
    end
  end

  def new
    @avenger = Avenger.new
  end

  def create
    @avenger = Avenger.new(avenger_params)
    @avenger.user = current_user
    if @avenger.save!
      redirect_to avenger_path(@avenger)
    else
      render :new
    end
  end

  def destroy
    @avenger.destroy
    redirect_to avengers_path
  end

  def edit
  end

  def update
    @avenger.update(avenger_params)
    redirect_to avenger_path(@avenger)
  end

  private

  def set_avenger
    @avenger = Avenger.find(params[:id])
  end

  def avenger_params
    params.require(:avenger).permit(:name, :description, :price, :location)
  end
end
