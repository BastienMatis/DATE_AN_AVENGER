class UsersController < ApplicationController
  def show
    @bookings = current_user.bookings
    booking.user == current_user # this is a booking I made for an avenger
    booking.avenger.user == current_user # this is a booking for one of my avengers
  end
end
