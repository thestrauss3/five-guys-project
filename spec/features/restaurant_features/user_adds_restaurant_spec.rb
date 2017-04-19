require "rails_helper"

feature "sees restaurants do" do
  scenario "user visits index of page of restaurants" do
    visit restaurants_path
    expect(page).to have_content("Restaurant not on our list? Add one to the list!")
    click_button "Add Restaurant"
    expect(page).to have_content(restaurant1.name)
    expect(page).to have_content(restaurant2.name)
  end
end
