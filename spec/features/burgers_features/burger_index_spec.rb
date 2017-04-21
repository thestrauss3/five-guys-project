require "rails_helper"

feature "User views a burger index page" do
  let(:restaurant1) { FactoryGirl.create(:restaurant) }
  let(:restaurant2) { FactoryGirl.create(:restaurant) }
  let(:burger1) { FactoryGirl.create(:burger, restaurant: restaurant1) }
  let(:burger2) { FactoryGirl.create(:burger, restaurant: restaurant2) }

  scenario "User visits the overall burger index" do
    restaurant1
    restaurant2
    burger1
    burger2

    visit burgers_path

    expect(page).to have_content "All Burgers"
    expect(page).to have_content burger1.name
    expect(page).to have_content burger2.name
  end
end
