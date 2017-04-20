require "rails_helper"

feature "User views a burger index page" do
  let(:five_guys) { Restaurant.create name: "Five Guys", location: "Boston", description: "This place has great burgers" }
  let(:wendys) { Restaurant.create name: "Wendy's", location: "Boston", description: "Square burgers mmm tasty" }
  let(:baconator) { Burger.create name: "baconator", description: "lots of bacon and lots of text", restaurant: wendys, image_url: "baconator.jpg" }
  let(:five_guys_burger) { Burger.create name: "Five Guys' Burger", description: "Best of the best extra text for length", restaurant: five_guys }

  scenario "User visits the overall burger index" do
    wendys
    five_guys
    baconator
    five_guys_burger

    visit burgers_path

    expect(page).to have_content "All Burgers"
    expect(page).to have_content "baconator"
    expect(page).to have_content "Five Guys' Burger"
  end

  scenario "User visits the burger index for a particular restaurant" do
    five_guys
    five_guys_burger
    wendys
    baconator

    visit restaurant_path(five_guys)
    expect(page).to have_content "Burgers available at Five Guys"
    expect(page).to have_content "Five Guys' Burger"
    expect(page).to_not have_content "baconator"
  end
end
