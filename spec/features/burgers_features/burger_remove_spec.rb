require "rails_helper"

feature "user deletes burger submission" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:restaurant) { FactoryGirl.create(:restaurant) }
  let!(:burger) {FactoryGirl.create(:burger, restaurant: restaurant, user: user)}

  scenario "logged in user deletes burger from their burger submissions list and is redirected to an updated version of their profile page" do
    login_as(user, :scope => :user)
    visit user_path(user)


      click_link ("x")
      expect(page).to_not have_content burger.name
      expect(page).to have_content ("Burger Deleted")

  end
end
