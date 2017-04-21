FactoryGirl.define do
  factory :review do
    burger_rating { Faker::Number.between(1, 5) }
    body { Faker::ChuckNorris.fact + "REVIEW BODY" }
    review_rating 0
  end
end
