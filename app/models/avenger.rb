class Avenger < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, uniquenss: true
  vaidates :price, presence: true
  vaidates :description, presence: true
end
