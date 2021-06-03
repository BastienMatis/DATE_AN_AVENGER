class ReviewsController < ApplicationController
  before_action :set_avenger, only: [:new, :create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params.merge(avenger_id: @avenger.id, user_id: current_user.id)) #merging @avenger.id to review
    if @review.save
      redirect_to avenger_path(@avenger)
      # path to change to user_path(@user) (or profile path but something to do with where useres view their own bookings)
    else
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to avenger_path(@review.avenger)
  end

  private
  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def set_avenger
    @avenger = Avenger.find(params[:avenger_id])
  end

end
