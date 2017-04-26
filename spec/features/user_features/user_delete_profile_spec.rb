require "rails_helper"

feature "user deletes profile" do
  let(:user) { FactoryGirl.create(:user) }


  scenario "logged in user deletes their user profile and is redirected to login page " do
    login_as(user, :scope => :user)
    visit user_path(user)

    click_link "Delete User Profile"
    expect(page).to have_content ("User Profile Deleted")
  end
end
