require "rails_helper"

feature "User visits new burger page" do
  let(:restaurant) { Restaurant.create(name: "restaurant", location: "Boston", dining_type: "Might be a selction", description: "Really long lines and really long text", hours: "10am-10pm") }
  let(:restaurant) { FactoryGirl.create(:restaurant) }
  scenario "User sees a form to enter burger information" do
    restaurant
    visit new_restaurant_burger_path(restaurant)
    expect(page).to have_content "Add a burger"
    expect(page).to have_xpath "//input"
  end
  scenario "User successfully adds a burger" do
    restaurant
    visit new_restaurant_burger_path(restaurant)

    fill_in 'Name', with: "Double Garlic Steak Burger"
    fill_in 'Price', with: 4
    fill_in 'Description', with: "A seasame seed bun, swiss cheese, and two beef patties slathered in Garlic Butter"
    click_button 'Add Burger'

    expect(page).to have_content "Burger submitted successfully"
    expect(page).to have_current_path(burger_path(Burger.find_by(name: "Double Garlic Steak Burger")))
    expect(page).to have_content "Double Garlic Steak Burger"
  end
  scenario "User does not provide valid information for burger" do
    restaurant
    visit new_restaurant_burger_path(restaurant)
    click_button 'Add Burger'

    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Description can't be blank"
  end
end
