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

# 5.times do |i|
#   RoomType.create(name: "#{i +1} star")
# end

10.times do |i|
  Accomodation.create(name: "#{i +1}")
end
role = Role.create(name: 'admin')
user = User.create(username: 'Ali',email:'ali@gmail.com',password:'123456', role:role)
roomType = RoomType.create(name: 'test')
Room.create(name: 'room1',number_of_beds:2,price:200,description:'details',room_type: roomType,user:user)

Role.create(name: "super_admin")
Role.create(name: "admin")
Role.create(name: "client")

5.times do |i|
  RoomType.create(name: "#{i+1} star")
end

10.times do |i|
Accomodation.create(name: "Acc #{i+1}")
end

Room.create(name: "Regular", number_of_beds: 2, price: 400, description: "Some description about a double bed hotel room", room_type_id: 1, user_id: 1, picture: "https://media.cntraveler.com/photos/56799015c2ebbef23e7d927b/master/pass/Hotelroom-Alamy.jpg")
Room.create(name: "Deluxe", number_of_beds: 3, price: 500, description: "Some details about a delux room", room_type_id: 2, user_id: 1, picture: "https://cdn.loewshotels.com/loewshotels.com-2466770763/cms/cache/v2/5f5a6e0d12749.jpg/1920x1080/fit/80/86e685af18659ee9ecca35c465603812.jpg")

