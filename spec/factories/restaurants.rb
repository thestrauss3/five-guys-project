FactoryGirl.define do
  factory :restaurant do
    name { Faker::Company.name + "RESTAURANT NAME"}
    location { Faker::Address.city + "RESTAURANT LOCATION"}
    description { Faker::Commerce.promotion_code(20) + "RESTAURANT DESCRIPTION" }
    dining_type "Might be a selection"
    hours "24/7"
  end
end
