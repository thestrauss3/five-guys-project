# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Restaurant.destroy_all
Burger.destroy_all
User.destroy_all
10.times do
  FactoryGirl.create(:restaurant, name: { Faker::Company.name }, location: { Faker::Address.city }, description: { Faker::Company.catch_phrase + "<< Restaurant Description" })
end
Restaurant.all.each do |r|
  5.times do
    FactoryGirl.create(:burger, restaurant: r)
  end
end
Burger.all.each do |b|
  3.times do
    FactoryGirl.create(:review, burger: b)
  end
end
