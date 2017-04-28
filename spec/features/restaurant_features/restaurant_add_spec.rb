require "rails_helper"

feature "User can click a link from restaurant index to add a new restaurant" do

  let!(:user1) { FactoryGirl.create(:user) }

  scenario "user sees link to add a restaurant" do
    login_as(user1, :scope => :user)
    visit restaurants_path
    expect(page).to have_content("Restaurant not on our list? Add one to the list!")

    click_link "Add a Restaurant"
    expect(page).to have_content("Restaurant Form")
  end

  scenario "user visits on restaurant form page" do
    login_as(user1, :scope => :user)
    visit new_restaurant_path
    fill_in 'Name', with: "Wendys"
    fill_in 'Location', with: "Boston"
    fill_in 'Dining Type', with: "Fast Food"
    fill_in 'Description', with: "Make sure you grab the frosty with the burger"
    fill_in 'Hours', with: "9AM-10PM"
    click_button "Add Restaurant"

    expect(page).to have_content "Restaurant added successfully"
    expect(page).to have_content "Wendys"
  end

  scenario "user trys to submit an incomplete form" do
    login_as(user1, :scope => :user)

    visit new_restaurant_path
    click_button "Add Restaurant"

    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Location can't be blank"
    expect(page).to have_content "Description can't be blank"
    expect(page).to have_content "Description is too short (minimum is 20 characters)"
  end
end
