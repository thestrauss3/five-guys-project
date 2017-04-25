require "rails_helper"

feature "User want to delete a burger" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:admin) { FactoryGirl.create(:user, email: "bilbow@yahoo.com", admin: true) }
  let!(:fake_user) { FactoryGirl.create(:user, email: "marshmellow@coco.com") }

  let!(:restaurant) { FactoryGirl.create(:restaurant) }
  let!(:burger) { FactoryGirl.create(:burger, restaurant: restaurant, user:user) }


  scenario "User that added the burger deletes the burger" do
    visit burger_path(burger)
    # target some x related to the burger --> for users page
    click_button "Delete Burger Submission"
    expect(page).to have_content "You have successfully delete the burger submission"
    # visit new_restaurant_burger_path(restaurant)
    # expect(page).to have_content "Please log in before trying to submit a burger!"
    # expect(page).to_not have_content "Add a burger"
  end

  scenario "Admin deletes the burger" do
    visit burger_path(burger)
    # target some x related to the burger --> for users page
    click_button "Delete Burger Submission"
    expect(page).to have_content "You have successfully delete the burger submission"
  end

  scenario "Fake user deletes the burger" do
    visit burger_path(burger)
    # target some x related to the burger --> for users page
    click_button "Delete Burger Submission"
    expect(page).to have_content "You must be the submitter or an admin to delete this post"
  end
end
