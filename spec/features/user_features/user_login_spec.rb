require "rails_helper"

feature "user visits the index page" do
  scenario "user visits root page to sign up or log in" do
    visit root_path
    expect(page).to have_content "Sign Up"  #might bee expect link Sign_up
    expect(page).to have_content "Log In"  #might bee expect link Sign_up
  end

  scenario "if user is signed in, should not see log in or sign up" do
    user = User.create(email: "omar@gmail.com", password: "123456", first_name: "Omar", last_name: "Jamal", username: "The Juice")
    visit new_user_session_path
    fill_in "Email", with: "omar@gmail.com"
    fill_in "Password", with: "123456"
    click_button "Log in"
    expect(page).to have_content "Log Out"
    expect(page).to have_content "Log Out"
    expect(page).not_to have_content "Log In"
    expect(page).not_to have_content "Sign Up"
  end

  scenario "user tries to log in" do
    visit root_path
    click_link "Log In"
    expect(page).to have_content "Email"
    expect(page).to have_content "Password"
  end
end
