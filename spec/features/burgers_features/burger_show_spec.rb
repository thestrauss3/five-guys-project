require "rails_helper"

feature "User views information about a specific burger" do
  let!(:restaurant1) { FactoryGirl.create(:restaurant) }
  let!(:restaurant2) { FactoryGirl.create(:restaurant) }
  let!(:burger1) do
    FactoryGirl.create(:burger,
      restaurant: restaurant1,
      image_url: nil,
      name: "Just another burger")
  end
  let!(:burger2) do
    FactoryGirl.create(:burger, restaurant: restaurant2)
  end
  let!(:review_with_high_vote) do
    FactoryGirl.create(:review,
    review_rating: 6,
    burger: burger2,
    body: "This is the best burger I've ever had")
  end
  let!(:review_with_low_vote) do
    FactoryGirl.create(:review,
    review_rating: -3,
    burger: burger2,
    body: "this burger is so goooood")
  end


  scenario "User should see things about the Burger" do
    visit burger_path(burger2)

    expect(page).to have_content burger2.name
    expect(page).to_not have_content burger1.name
    expect(page).to have_content burger2.description
    # expect(page).to have_xpath("//img")
  end

  scenario "If there is no image, there is no image shown" do
    visit burger_path(burger1)

    # expect(page).to_not have_xpath("//img")
  end

  scenario "User sees the review with the most upvotes" do
    visit burger_path(burger2)
    expect(page).to have_content review_with_high_vote.body
    expect(page).to_not have_content review_with_low_vote.body
  end
end
