# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Restaurant.destroy_all
Burger.destroy_all
five_guys = Restaurant.create(name: "Five guys", location: "Boston", dining_type: "Might be a selction", description: "Really awesome food Filler text Filler text Filler text Filler text Filler text Filler text Filler text Filler text Filler text", hours: "9am-9pm")
wendys = Restaurant.create(name: "Wendys", location: "Boston", dining_type: "Might be a selction", description: "Really long lines, don't forget that frosty(chocolate)", hours: "10am-10pm")
mcdonalds = Restaurant.create(name: "McDonalds", location: "Boston", dining_type: "Might be a selction", description: "Got dem fries and got that McFrosty shakersssss", hours: "11am-11pm")
Burger.create name: "Baconator", description: "Lots of bacon", price: "$5", restaurant: wendys, image_url: "baconator.jpg"
Burger.create name: "Five Guys Burger", description: "MMmmmmm", price: "$10", restaurant: five_guys, image_url: "https://lintvkhon.files.wordpress.com/2016/06/fiveguys_burgerfries2.jpg?w=650&h=433"
Burger.create name: "Big Mac", description: "Special Sauce", price: "$8", restaurant: mcdonalds
