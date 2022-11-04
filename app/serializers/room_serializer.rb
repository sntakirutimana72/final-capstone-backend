class RoomSerializer < ActiveModel::Serializer
  attributes :name, :number_of_beds, :price, :type, :description, :accomodations, :picture, :id

  has_many :accomodations, through: :room_accomodations

  def type
    object.room_type.name
  end

  def accomodations
    object.accomodations.map(&:name)
  end
end
