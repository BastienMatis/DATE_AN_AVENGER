class AvengersController < ApplicationController
  before_action :set_avenger, only: [:show, :edit, :update, :destroy]
  def index
    @avengers = Avenger.all
  end

  def show
    @avengers = Avenger.all
    @avenger = Avenger.find(params[:id])
  end

  def new
    @avenger = Avenger.new
  end

  def create
    @avenger = Avenger.new(avenger_params)
    @avenger.user = current_user
    if @avenger.save
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
    params.require(:avenger).permit(:name, :description, :price)
  end
end
