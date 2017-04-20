require "rails_helper"

feature "User views information about a specific burger" do
  let(:five_guys) { Restaurant.create name: "Five Guys", location: "Boston", description: "This place has great burgers" }
  let(:wendys) { Restaurant.create name: "Wendy's", location: "Boston", description: "Square burgers mmm tasty" }
  let(:baconator) { Burger.create name: "baconator", description: "lots of bacon and lots of text", restaurant: wendys, image_url: "baconator.jpg" }
  let(:five_guys_burger) { Burger.create name: "Five Guys' Burger", description: "Best of the best extra text for length", restaurant: five_guys }

  scenario "User should see things about the Burger" do
    wendys
    baconator

    visit burger_path(baconator)

    expect(page).to have_content "baconator"
    expect(page).to have_css("img[src*='baconator']")
  end

  scenario "If there is no image, there is no image shown" do
    five_guys
    five_guys_burger

    visit burger_path(five_guys_burger)

    expect(page).to_not have_xpath("//img")
  end

  scenario "User sees the review with the most upvotes" do
    wendys
    baconator
    Review.create burger_rating: 4, body: "This burger is awesome, so much bacon, love it", review_rating: 6, burger: baconator
    Review.create burger_rating: 1, body: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", review_rating: -3, burger: baconator

    visit burger_path(baconator)

    expect(page).to have_content "This burger is awesome, so much bacon, love it"
    expect(page).to_not have_content "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
  end
end
