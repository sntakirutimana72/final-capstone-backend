# Generate different system roles
%w[guest admin super_admin].each { | name | Role.create(name:) }
# Generate various room types
%w[single couple family-3 family-4 family-5].each { | name | RoomType.create(name:) }
# Generate various room accomodations
%w[internet lunch dinner breakfast garden transport].each { | name | Accomodation.create(name:) }

# my reservation dependent data
#
# create admin user
admin = User.create(username: 'Jaguar', email: 'jgnuru@email', password: 'pwd@123', role_id: 2)
# create rooms
#
## for single
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
#
# create a guest user
guest = User.create(username: 'dev', email: 'dev@email', password: 'pwd@123', role_id: 1)
#
# make reservations
guest.reservations.create(room: room_single, from_date: Date.today, to_date: Date.today + 1.day)
guest.reservations.create(room: room_couple, from_date: Date.today, to_date: Date.today + 1.day)
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# 3.times do |i|
#   Role.create(name: "role #{i +1}")
# end

Role.create(name: "super_admin")
Role.create(name: "admin")
Role.create(name: "client")

5.times do |i|
  RoomType.create(name: "#{i+1} star")
end

10.times do |i|
  Accomodation.create(name: "#{i +1}")
end
 

