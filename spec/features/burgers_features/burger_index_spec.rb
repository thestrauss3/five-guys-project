require "rails_helper"

feature "User views a burger index page" do
  let!(:restaurant1) { FactoryGirl.create(:restaurant) }
  let!(:restaurant2) { FactoryGirl.create(:restaurant) }
  let!(:burger1) { FactoryGirl.create(:burger, restaurant: restaurant1) }
  let!(:burger2) do
    FactoryGirl.create(:burger, restaurant: restaurant2, name: "Awesome burger")
  end

  xscenario "User visits the overall burger index" do
    visit burgers_path
    # Burger Index page being rendered in React, testing must be added
    expect(page).to have_content "All Burgers"
    expect(page).to have_content burger1.name
    expect(page).to have_content burger2.name
  end
end
