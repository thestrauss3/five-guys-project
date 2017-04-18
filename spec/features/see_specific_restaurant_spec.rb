require "rails-helper"

feature "user visits a specific restaurant" do
  scenario "user can click on the name of a restaurant to go to its page" do
    restaurant1 = Restaurant.create(name: "Five guys", location: "Boston", dining_type: "Might be a selction", description: "Really awesome food", hours: "some time stamps")
    click_link restaurant1.name

    expect(page).to have_content(restaurant1.name)
    expect(page).to have_content(restaurant1.location)
    expect(page).to have_content(restaurant1.dining_type)
    expect(page).to have_content(restaurant1.description)
    expect(page).to have_content(restaurant1.hours)

  end
end
