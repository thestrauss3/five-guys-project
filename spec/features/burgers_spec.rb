require "rails_helper"

feature "user views homepage" do
  scenario "users sees title and list of top burgers" do
    visit root_path
    expect(page).to have_content "Nine to Five Guys"
    expect(page).to have_content "Nine Burgers to Know"
  end
  scenario "user sees a sign in button if not already signed in" do
    visit root_path
    expect(page).to have_content "Sign in"
  end
  # xscenario "User can sign out if already logged in" do
    # visit root_path
    # expect(page).to_not have_content "Sign out"
    # click "Sign in"
  # end
end

feature "User views a burger index page" do
  scenario "User visits the overall burger index" do
    Burger.create name: "baconator", description: "lots of bacon", restaurant_name: "wendys"
    Burger.create name: "Five Guys' Burger", description: "Best of the best", restaurant_name: "five_guys"
    visit burgers_path
    expect(page).to have_content "All Burgers"
    expect(page).to have_content "baconator"
    expect(page).to have_content "Five Guys' Burger"
  end
  # xscenario "User visits the burger index for a particular restaurant" do
    # five_guys = Restaurant.create name: "Five Guys", location: "Boston"
    # wendys = Restaurant.create name: "Wendy's", location: "Boston"
    # Burger.create name: "baconator", description: "lots of bacon", restaurant: wendys
    # Burger.create name: "Five Guys' Burger", description: "Best of the best", restaurant: five_guys
    # expect(page).to have_content "Five Guys' Burger"
    # expect(page).to_not have_content "baconator"
  # end
end

feature "User views a specific burger page" do
  scenario "User should see things about the Burger" do
    baconator = Burger.create name: "Baconator", description: "Lots of bacon", price: "$5", restaurant_name: "Wendys", image_url: "baconator.jpg"
    visit burger_path(baconator)
    expect(page).to have_content "Baconator"
    expect(page).to have_xpath("//img[contains(@src, 'baconator.jpg')]")
  end
end
