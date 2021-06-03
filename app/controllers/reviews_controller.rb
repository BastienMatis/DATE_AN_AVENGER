class ReviewsController < ApplicationController
  before_action :set_avenger, only: [:new, :create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.avenger = @avenger
    @review.user = current_user
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
