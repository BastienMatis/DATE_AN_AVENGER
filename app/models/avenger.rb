class Avenger < ApplicationRecord
  belongs_to :user
  
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true
  validates :description, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
