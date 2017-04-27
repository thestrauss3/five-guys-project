require "rails_helper"

feature "User visits the review index page" do
  let!(:restaurant) do
    FactoryGirl.create(:restaurant, dining_type: "Slow", hours: "closed")
  end
  let!(:burger) do
    FactoryGirl.create(:burger, restaurant: restaurant)
  end
  let!(:first_review) do
    FactoryGirl.create(:review,
      burger_rating: 3,
      burger: burger,
      body: "Wow I was the first person to try this burger")
  end
  let!(:best_review) do
    FactoryGirl.create(:review,
    burger_rating: 5,
    burger: burger,
    body: "This is the best burger I have ever ever had.")
  end
  let!(:highest_rated_review) do
    FactoryGirl.create(:review,
    burger_rating: 3,
    review_rating: 6,
    burger: burger,
    body: "You should get extra bacon and cheese for free")
  end

  scenario "User sees all the reviews for a particular burger" do
    visit burger_reviews_path(burger)

    expect(page).to have_content first_review.body
    expect(page).to have_content best_review.body
    expect(page).to have_content highest_rated_review.body
    expect(page).to have_content first_review.burger_rating
    expect(page).to have_content highest_rated_review.review_rating
  end
end
