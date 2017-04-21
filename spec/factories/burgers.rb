FactoryGirl.define do
  factory :burger do
    name { Faker::Ancient.hero + "BURGER NAME" }
    description { Faker::Internet.ip_v6_address + " <<< burger description" }
    image_url { Faker::Avatar.image + "BURGER IMAGE_URL"}
    price { Faker::Number.between(1,20) }
  end
end
