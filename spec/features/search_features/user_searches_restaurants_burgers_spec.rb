require 'rails_helper'

feature "User wants to search for a restaurant or burger" do
  let!(:restaurant1) { FactoryGirl.create(:restaurant, name: "Mc Donalds") }
  let!(:restaurant2) { FactoryGirl.create(:restaurant, name: "Five Guys") }
  let!(:restaurant3) { FactoryGirl.create(:restaurant, name: "Burger King") }
  let!(:burger1_owner) {FactoryGirl.create(:user) }
  let!(:burger2_owner) {FactoryGirl.create(:user, email: '925guys@gmail.com') }
  let!(:burger3_owner) {FactoryGirl.create(:user, email: '9to5guys@gmail.com') }
  let!(:burger1) do
    FactoryGirl.create(:burger,
      name: "Big Mac",
      restaurant: restaurant1,
      user: burger1_owner
    )
  end
  let!(:burger2) do
    FactoryGirl.create(:burger,
      name: "Whopper",
      restaurant: restaurant1,
      user: burger2_owner
    )
  end
  let!(:burger3) do
    FactoryGirl.create(:burger,
      name: "Cheese Burger",
      restaurant: restaurant1,
      user: burger3_owner
    )
  end


  scenario "User searches for specific burger" do
    visit root_path
    fill_in "search", with: "burger"
    click_button "Search"
    expect(page).to have_link(restaurant3.name)
    expect(page).to have_link(burger3.name)
    expect(page).to_not have_link(burger1.name)
    expect(page).to_not have_link(burger2.name)
    expect(page).to_not have_link(restaurant1.name)
    expect(page).to_not have_link(restaurant2.name)

  end

  scenario "User searches for specific restaurant" do
    visit root_path
    fill_in "search", with: "Guys"
    click_button "Search"
    expect(page).to have_link(restaurant2.name)
    expect(page).to_not have_link(restaurant1.name)
    expect(page).to_not have_link(restaurant3.name)
    expect(page).to_not have_link(burger1.name)
    expect(page).to_not have_link(burger2.name)
    expect(page).to_not have_link(burger3.name)
  end

  scenario "User submits a empty search form" do
    visit root_path
    click_button "Search"
    expect(page).to have_content("You have submitted a empty query")
  end

  scenario "User submits a query with no returns" do
    visit root_path
    fill_in "search", with: "zebra"
    click_button "Search"
    expect(page).to have_content("Searches have not resulted in any matches")
  end
end
