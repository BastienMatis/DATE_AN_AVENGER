class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :avenger
  validates :location, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
end
