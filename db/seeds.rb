# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# 3.times do |i|
#   Role.create(name: "role #{i +1}")
# end

# 5.times do |i|
#   RoomType.create(name: "#{i +1} star")
# end
role = Role.create(name: 'admin')
user = User.create(username: 'Ali',email:'ali@gmail.com',password:'123456', role:role)
roomType = RoomType.create(name: 'test')
Room.create(name: 'room1',number_of_beds:2,price:200,description:'details',room_type: roomType,user:user)

10.times do |i|
  Accomodation.create(name: "#{i +1}")
end