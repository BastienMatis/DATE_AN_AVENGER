class UsersController < ApplicationController
  def my_account
    @user = current_user
    @bookings = @user.bookings
    @my_received_bookings = @user.my_received_bookings
    @avenger = Avenger.new
    @avengers = @user.avengers
    # booking.user == current_user # this is a booking I made for an avenger
    # booking.avenger.user == current_user # this is a booking for one of my avengers
  end
end
