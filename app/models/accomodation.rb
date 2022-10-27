class Accomodation < ApplicationRecord
    has_many :rooms
    has_many :rooms, through: :room_accomodations
end
