require "rails_helper"

feature "user deletes profile" do
  let(:user) { FactoryGirl.create(:user) }
  let(:user2) { FactoryGirl.create(:user, username: "Kenny", email: "bigmac@gmail.com") }



  scenario "logged in user deletes their user profile and is redirected to login page " do
    login_as(user, :scope => :user)
    visit user_path(user)

    click_link "Delete User Profile"
    expect(page).to have_link ("Log In")
    expect(page).to have_link ("Sign Up")
    expect(page).to have_content ("User Profile Deleted")

  end

  scenario "User cannot delete another user's page" do
    login_as(user, :scope => :user)
    visit user_path(user2)

    expect(page).to_not have_content user2.username

  end
end
