class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :gun
  belongs_to :booking_review, dependent: :destroy

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :amount, presence: true
end
