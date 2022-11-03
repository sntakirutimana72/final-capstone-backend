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

