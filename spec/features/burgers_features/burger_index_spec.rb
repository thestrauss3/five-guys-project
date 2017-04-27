require "rails_helper"

feature "User views a burger index page" do
  let!(:restaurant1) { FactoryGirl.create(:restaurant) }
  let!(:restaurant2) { FactoryGirl.create(:restaurant) }
  let!(:burger1) { FactoryGirl.create(:burger, restaurant: restaurant1, name: "The Beast Burger") }
  let!(:burger2) do
    FactoryGirl.create(:burger, restaurant: restaurant2, name: "Awesome burger")
  end

  scenario "User visits the overall burger index" do
    visit burgers_path

    expect(page).to have_content "All Burgers:"
    expect(page).to have_content burger1.name
    expect(page).to have_content burger2.name
  end
end
