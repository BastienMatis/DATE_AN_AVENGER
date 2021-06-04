class Avenger < ApplicationRecord

  belongs_to :user
  has_many :bookings
  has_many :reviews
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true
  validates :description, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  has_one_attached :photo

   include PgSearch::Model
    pg_search_scope :search_by_name_and_description,
    against: [ :name, :description ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
