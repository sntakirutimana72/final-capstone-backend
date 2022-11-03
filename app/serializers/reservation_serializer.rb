class ReservationSerializer < ActiveModel::Serializer
  attributes :id, :from_date, :to_date, :status
  belongs_to :room

  def status
    if object.confirmed.nil?
      'Pending'
    elsif object.confirmed == false
      'Denied'
    else
      'Confirmed'
    end
  end
end
