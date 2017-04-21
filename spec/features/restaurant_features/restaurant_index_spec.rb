require "rails_helper"

feature "User visits restaurant index page" do
  let(:restaurant1) { FactoryGirl.create(:restaurant) }
  let(:restaurant2) { FactoryGirl.create(:restaurant) }
  let(:burger1) { FactoryGirl.create(:burger, restaurant: restaurant1) }
  let(:burger2) { FactoryGirl.create(:burger, restaurant: restaurant2) }

  scenario "User sees a list of all restaurants" do
    restaurant1
    restaurant2
    visit restaurants_path
    expect(page).to have_content("Restaurant List")
    expect(page).to have_content(restaurant1.name)
    expect(page).to have_content(restaurant2.name)
  end

  scenario "User can click a restaurant to go to the page for that restaurant" do
    restaurant1
    visit restaurants_path
    click_link restaurant1.name
    expect(page).to have_content restaurant1.description
  end
end
