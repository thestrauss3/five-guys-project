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
feature "User views information about burgers" do
  let(:five_guys) { Restaurant.create name: "Five Guys", location: "Boston", description: "This place has great burgers" }
  let(:wendys) { Restaurant.create name: "Wendy's", location: "Boston", description: "Square burgers mmm tasty" }
  let(:baconator) { Burger.create name: "baconator", description: "lots of bacon and lots of text", restaurant: wendys, image_url: "baconator.jpg" }
  let(:five_guys_burger) { Burger.create name: "Five Guys' Burger", description: "Best of the best extra text for length", restaurant: five_guys }

  feature "User views a burger index page" do
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

      expect(page).to have_content "Five Guys' Burger"
      expect(page).to_not have_content "baconator"
    end
  end

  feature "User views a specific burger page" do
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
  end
end
