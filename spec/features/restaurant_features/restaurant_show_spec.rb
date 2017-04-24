require "rails_helper"

feature "User visits a specific restaurant page" do
  let!(:restaurant1) do
    FactoryGirl.create(:restaurant,
    name: "Five Guys",
    location: "Wisconsin",
    dining_type: "Slow",
    description: "This place is really not that great",
    hours: "closed")
  end
  let!(:restaurant2) { FactoryGirl.create(:restaurant) }
  let!(:burger1) do
    FactoryGirl.create(:burger,
    restaurant: restaurant1,
    name: "good burger")
  end
  let!(:burger2) do
    FactoryGirl.create(:burger,
    restaurant: restaurant2,
    name: "Awesome burger")
  end

  scenario "User can click on the name of a restaurant to go to its page" do
    visit restaurant_path(restaurant1)

    expect(page).to have_content(restaurant1.name)
    expect(page).to have_content(restaurant1.location)
    expect(page).to have_content(restaurant1.dining_type)
    expect(page).to have_content(restaurant1.description)
    expect(page).to have_content(restaurant1.hours)
  end

  scenario "User should see a list of burgers belonging to that restaurant" do
    visit restaurant_path(restaurant2)

    expect(page).to have_content burger2.name
    expect(page).to_not have_content burger1.name
  end

  scenario "User should be able to click a burger to see more information about that burger" do
    visit restaurant_path(restaurant2)

    click_link burger2.name

    expect(page).to have_content burger2.name
    expect(page).to have_content burger2.description
    expect(page).to have_content burger2.price
  end
end
