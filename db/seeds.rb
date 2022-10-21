# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Insert 5 diffrents room types.
room1 = RoomType.create(type_name: "1 star");
room2 = RoomType.create(type_name: "2 stars");
room3 = RoomType.create(type_name: "3 stars");
room4 = RoomType.create(type_name: "4 stars");
room5 = RoomType.create(type_name: "5 stars");

# Insert 5 diffrents accomodations.
acc1 = Accomodation.create(name: "Wifi");
acc2 = Accomodation.create(name: "TV");
acc3 = Accomodation.create(name: "Air conditioning");
acc4 = Accomodation.create(name: "Parking");
acc5 = Accomodation.create(name: "Pool");