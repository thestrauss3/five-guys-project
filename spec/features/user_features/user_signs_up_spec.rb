require "rails_helper"

feature "user attempts to sign up" do
  scenario "user tries to sign up" do
    visit root_path
    click_link "Sign Up"
    expect(page).to have_content "First Name"
    expect(page).to have_content "Last Name"
    expect(page).to have_content "Email"
    expect(page).to have_content "Username"
    expect(page).to have_content "Password (6 characters minimum)"
    expect(page).to have_content "Password confirmation"
  end

  scenario "user successfully signs up" do
    visit new_user_registration_path
    fill_in "First Name", with: "Omar"
    fill_in "Last Name", with: "Jamal"
    fill_in "Email", with: "JamalOmar@gmail.com"
    fill_in "Username", with: "The Juice"
    fill_in "Password", with: "111111"
    fill_in "Password confirmation", with: "111111"
    click_button "Sign up"
    expect(page).to have_content "You have signed up successfully."
    expect(page).to have_content "Nine to Five Guys"
  end

  scenario "if user is not signed in, should not see log out" do
    visit root_path
    expect(page).to have_content "Log In"
    expect(page).to have_content "Sign Up"
    expect(page).not_to have_content "Log Out"
  end

  scenario "if sign up form is incomplete, they should see errors" do
    visit new_user_registration_path
    click_button "Sign up"
    expect(page).to have_content "Username can't be blank"
    expect(page).to have_content "First name can't be blank"
    expect(page).to have_content "Last name can't be blank"
    expect(page).to have_content "Email can't be blank"
    expect(page).to have_content "Password can't be blank"
  end

end
