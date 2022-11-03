module ModelSpecHelpers
  def create_role(name = 'guest')
    Role.create(name:)
  end

  def create_admin(options = {})
    User.create(
      {
        username: 'admin', email: 'admin@email', password: 'pwd@123',
        **options,
        role: create_role('admin')
      }
    )
  end

  def create_user(options = {})
    options[:role] ||= create_role
    User.create(
      {
        username: 'dev1', email: 'dev1@email', password: 'pwd@123',
        **options
      }
    )
  end

  def create_room(options = {})
    options[:room_type] ||= RoomType.create(name: 'single')
    options[:user] ||= create_admin
    room = Room.create(
      {
        name: 'RM-05', number_of_beds: 2, price: 53,
        **options
      }
    )
    room.accomodations.create(name: 'garden')
    room
  end

  def reserve_room(options = {})
    options[:user] ||= create_user
    options[:room] ||= create_room
    Reservation.create(from_date: Date.today, to_date: Date.today, **options)
  end

  def reset_all
    RoomAccomodation.delete_all
    Accomodation.delete_all
    Reservation.delete_all
    Room.delete_all
    RoomType.delete_all
    User.delete_all
    Role.delete_all
  end
end
