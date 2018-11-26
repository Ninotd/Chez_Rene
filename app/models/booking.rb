class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :gun

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :amount, presence: true
end
