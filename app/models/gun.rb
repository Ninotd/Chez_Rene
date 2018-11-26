class Gun < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  ARMES = ["Fusils de chasse", "Fusils à pompe", "Carabines", "Pistolets", "Armes blanches", "Fusils d'assault"]

  validates :name, presence: true
  validates :category, presence: true, inclusion: {
    in: ARMES
  }
  validates :price, presence: true

end
