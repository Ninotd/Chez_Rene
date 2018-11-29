class BookingReview < ApplicationRecord
  RATINGS = [0, 1, 2, 3, 4, 5]
  belongs_to :booking

  validates :rating, presence: true, inclusion: { in: RATINGS }
  validates :content, presence: true
  validates :booking_id, uniqueness: true
end
