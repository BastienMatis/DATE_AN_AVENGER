class Avenger < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true
  validates :description, presence: true
end
