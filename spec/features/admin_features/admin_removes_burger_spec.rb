require "rails_helper"

feature "admin deletes burger submission" do
  let!(:user) { FactoryGirl.create(:user, admin: true) }
  let!(:user2) { FactoryGirl.create(:user, username: "bad guy", email: "nonadmin@gmail.com") }
  let!(:restaurant) { FactoryGirl.create(:restaurant) }
  let!(:burger15) {FactoryGirl.create(:burger, restaurant: restaurant, user: user)}

  scenario "logged in admin deletes burger from individual burger show page" do
    login_as(user, :scope => :user)
    visit burger_path(burger15)

      click_link ("Delete This Burger")
      expect(page).to have_current_path(burgers_path)
      expect(page).to_not have_content burger15.name
      expect(page).to have_content ("Burger Deleted")
    end
end
