class Accomodation < ApplicationRecord
  has_many :room_accomodations
  has_many :rooms, through: :room_accomodations

  validates :name, presence: true
end
