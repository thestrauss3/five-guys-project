require "rails_helper"

feature "User visits new burger page" do
  scenario "User sees a form to enter burger information" do
    wendys = Restaurant.create(name: "Wendys", location: "Boston", dining_type: "Might be a selction", description: "Really long lines and really long text", hours: "10am-10pm")
    visit new_restaurant_burger_path(wendys)
    expect(page).to have_content "Add a burger"
    expect(page).to have_xpath "//input"

    fill_in 'Name', with: "Double Garlic Steak Burger"
    fill_in 'Price', with: "four dollars"
    fill_in 'Description', with: "A seasame seed bun, swiss cheese, and two beef patties slathered in Garlic Butter"
    click_button 'Add Burger'
    expect(page).to have_current_path(burger_path(Burger.find_by(name: "Double Garlic Steak Burger")))
    expect(page).to have_content "Double Garlic Steak Burger"
  end
end
