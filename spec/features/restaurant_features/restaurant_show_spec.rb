require "rails_helper"

feature "User visits a specific restaurant page" do
  let(:restaurant1) { FactoryGirl.create(:restaurant) }
  let(:restaurant2) { FactoryGirl.create(:restaurant) }
  let(:burger1) { FactoryGirl.create(:burger, restaurant: restaurant1) }
  let(:burger2) { FactoryGirl.create(:burger, restaurant: restaurant2) }

  scenario "User can click on the name of a restaurant to go to its page" do
    restaurant1
    visit restaurant_path(restaurant1)

    expect(page).to have_content(restaurant1.name)
    expect(page).to have_content(restaurant1.location)
    expect(page).to have_content(restaurant1.dining_type)
    expect(page).to have_content(restaurant1.description)
    expect(page).to have_content(restaurant1.hours)
  end

  scenario "User should see a list of burgers belonging to that restaurant" do
    restaurant1
    restaurant2
    burger1
    burger2

    visit restaurant_path(restaurant2)

    expect(page).to have_content burger2.name
    expect(page).to_not have_content burger1.name
  end

  scenario "User should be able to click a burger to see more information about that burger" do
    restaurant1
    restaurant2
    burger1
    burger2

    visit restaurant_path(restaurant2)

    click_link burger2.name

    expect(page).to have_content burger2.name
    expect(page).to have_content burger2.description
    expect(page).to have_content burger2.price
  end
end
