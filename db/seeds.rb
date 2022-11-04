
Role.create(name: 'guest')
Role.create(name: 'admin')
Role.create(name: 'super_admin')

admin = User.create(username: 'Admin', email: 'admin@email.com', password: '123456', role_id: 2)

RoomType.create(name: 'Classic')
RoomType.create(name: 'Regular')
RoomType.create(name: 'Deluxe')

# accomodations necessary when creating a new room
%w(internet garden transportation breakfast dinner lunch).each { |name| Accomodation.create(name:) }

# create admin user
admin = User.create(username: 'Jaguar', email: 'jgnuru@email', password: 'pwd@123', role_id: 2)
# create rooms
room_single = Room.create(
  name: 'RMGT-05',
  number_of_beds: 1,
  price: 129.75,
  room_type_id: 1,
  user: admin,
  description: 'A high class room with a wonderful view and access to the roof'
)
room_single.accomodations.push(*Accomodation.all)
#
## for couple
room_couple = Room.create(
  name: 'RMGT-02',
  number_of_beds: 2,
  price: 179,
  room_type_id: 2,
  user: admin,
  description: 'A high class room with a wonderful view and access to the roof'
)
room_couple.accomodations.push(*Accomodation.first(3))