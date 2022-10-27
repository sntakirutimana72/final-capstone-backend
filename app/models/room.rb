class Room < ApplicationRecord
  belongs_to :room_type
  belongs_to :user
  has_many :reservations
  has_many :users, through: :reservations
  has_many :accomodations
  has_many :accomodations, through :room_accomodations

  validates :name, presence: true, uniqueness: true
  validates :number_of_beds, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :description, length: { maximum: 900 }
end
