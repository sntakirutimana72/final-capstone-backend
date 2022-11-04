
Role.create(name: 'guest')
Role.create(name: 'admin')
Role.create(name: 'super_admin')

admin1 = User.create(username: 'Chris', email: 'chris@gmail.com', password: '123456', role_id: 3)
admin2 = User.create(username: 'Safar', email: 'safar@email', password: '123456', role_id: 2)
admin3= User.create(username: 'Steve', email: 'steve@email', password: '123456', role_id: 3)
admin4 = User.create(username: 'Ali Atayee', email: 'atayee@email', password: '123456', role_id: 2)
admin5 = User.create(username: 'Olawale', email: 'olawale@email', password: '123456', role_id: 2)


RoomType.create(name: 'Classic')
RoomType.create(name: 'Regular')
RoomType.create(name: 'Deluxe')

# accomodations necessary when creating a new room
%w(internet garden transportation breakfast dinner lunch).each { |name| Accomodation.create(name:) }

# create admin user

# create rooms
# room_single = Room.create(
#   name: 'RMGT-05',
#   number_of_beds: 1,
#   price: 129.75,
#   room_type_id: 1,
#   user: admin,
#   description: 'A high class room with a wonderful view and access to the roof'
# )
# room_single.accomodations.push(*Accomodation.all)
# #
# ## for couple
# room_couple = Room.create(
#   name: 'RMGT-02',
#   number_of_beds: 2,
#   price: 179,
#   room_type_id: 2,
#   user: admin,
#   description: 'A high class room with a wonderful view and access to the roof'
# )
# room_couple.accomodations.push(*Accomodation.first(3))

# ##for vip

# room_vip = Room.create(
#   name: 'vi1-01',
#   number_of_beds: 1,
#   picture: ''
#   price: 1000,
#   room_type_id: 2,
#   user: admin,
#   description: 'A high class room with a wonderful view and access to the roof'
# )
# room_couple.accomodations.push(*Accomodation.first(5))

