class Review < ApplicationRecord
  belongs_to :user
  belongs_to :avenger
  validates :title, presence: true
  validates :content, presence: true
  validates :rating, inclusion: { in: 1..5 }
end
