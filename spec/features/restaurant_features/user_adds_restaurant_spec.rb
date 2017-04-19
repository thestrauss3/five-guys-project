require "rails_helper"

feature "visits restaurant index page do" do
  scenario "user sees link to add a restaurant" do

    visit restaurants_path
    expect(page).to have_content("Restaurant not on our list? Add one to the list!")

    click_button "Add a Restaurant"
    expect(page).to have_content("Restaurant Form")
  end

  scenario "user visits on restaurant form page" do
    visit new_restaurant_path
      fill_in 'Name', with: "Wendys"
      fill_in 'Location', with: "Boston"
      fill_in 'Dining Type', with: "Fast Food"
      fill_in 'Description', with: "Make sure you grab the frosty with the burger"
      fill_in 'Hours', with: "9AM-10PM"

      click_button "Submit"

      expect(page).to have_content "Restaurant added successfully"
      expect(page).to have_content "Wendys"


    # expect(page).to have_content("Name")
    # expect(page).to have_content("Location")
    # expect(page).to have_content("Dining Type")
    # expect(page).to have_content("Description")
    # expect(page).to have_content("Hours")

  end
end
