require "rails_helper"

feature "User visits the review index page" do
  let (:restaurant) { FactoryGirl.create(:restaurant, dining_type: "Fast food", hours: "24/7")}
  let (:burger) { FactoryGirl.create(:burger, restaurant: restaurant) }
  let (:first_review) { FactoryGirl.create(:review, burger_rating: 3, burger: burger) }
  let (:best_review) { FactoryGirl.create(:review, burger_rating: 5, burger: burger) }
  let (:highest_rated_review) { FactoryGirl.create(:review, burger_rating: 3, review_rating: 6, burger: burger) }

  scenario "User sees all the reviews for a particular burger" do
    restaurant
    burger
    first_review
    best_review
    highest_rated_review
    visit burger_reviews_path(burger)

    expect(page).to have_content first_review.body
    expect(page).to have_content best_review.body
    expect(page).to have_content highest_rated_review.body
    expect(page).to have_content first_review.burger_rating
    expect(page).to have_content highest_rated_review.review_rating
  end

  xscenario "User can sort reviews by newest, highest rated, most upvotes" do
  end
end
