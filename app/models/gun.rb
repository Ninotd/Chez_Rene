class Gun < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :booking_reviews, through: :bookings
  ARMES = ["Fusils de chasse", "Fusils à pompe", "Carabines", "Pistolets", "Armes blanches", "Fusils d'assault"]

  validates :name, presence: true
  validates :category, presence: true, inclusion: {
    in: ARMES
  }
  validates :price, presence: true
  validates :address, presence: true

  mount_uploader :photo, PhotoUploader

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch

  pg_search_scope :global_search,
  against: [:name, :category, :description, :year_of_production, :price, :address],
  associated_against: {
    user: [:email]
  },
  using: {
    tsearch: { prefix: true }
  }

  def average_rating
    reviews = self.booking_reviews
    reviews_count = reviews.count
    rating_sum = 0
    reviews.each do |review|
      rating_sum += review.rating
    end
    average = rating_sum / reviews_count
  end

end
