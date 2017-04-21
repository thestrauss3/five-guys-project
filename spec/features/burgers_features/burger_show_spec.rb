require "rails_helper"

feature "User views information about a specific burger" do
  let(:restaurant1) { FactoryGirl.create(:restaurant) }
  let(:restaurant2) { FactoryGirl.create(:restaurant) }
  let(:burger1) { FactoryGirl.create(:burger, restaurant: restaurant1, image_url: nil) }
  let(:burger2) { FactoryGirl.create(:burger, restaurant: restaurant2) }
  let(:review_with_high_vote) { FactoryGirl.create(:review, review_rating: 6, burger: burger2) }
  let(:review_with_low_vote) { FactoryGirl.create(:review, review_rating: -3, burger: burger2) }


  scenario "User should see things about the Burger" do
    visit burger_path(burger2)

    expect(page).to have_content burger2.name
    expect(page).to have_content burger2.description
    expect(page).to have_xpath("//img")
  end

  scenario "If there is no image, there is no image shown" do
    visit burger_path(burger1)

    expect(page).to_not have_xpath("//img")
  end

  scenario "User sees the review with the most upvotes" do
    burger2
    review_with_high_vote
    review_with_low_vote

    visit burger_path(burger2)

    expect(page).to have_content review_with_high_vote.body
    expect(page).to_not have_content review_with_low_vote.body
  end
end
