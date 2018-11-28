class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :gun
  has_many :booking_reviews, dependent: :destroy

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :amount, presence: true
end
