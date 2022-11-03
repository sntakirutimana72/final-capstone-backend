
Role.create(name: 'guest')
Role.create(name: 'admin')
Role.create(name: 'super_admin')

admin = User.create(username: 'Admin', email: 'admin@email.com', password: '123456', role_id: 2)

RoomType.create(name: 'Classic')
RoomType.create(name: 'Regular')
RoomType.create(name: 'Deluxe')

# accomodations necessary when creating a new room
%w(internet garden transportation breakfast dinner lunch).each { |name| Accomodation.create(name:) }
