require "rails_helper"

feature "user attemps to sign up" do
  scenario do
    visit new_user_registration_path
    fill_in "First Name", with: "Omar"
    fill_in "Last Name", with: "Jamal"
    fill_in "Email", with: "JamalOmar@gmail.com"
    fill_in "Password", with: "111111"
    fill_in "Password confirmation", with: "111111"
    click_button "Sign up"

    expect(page).to have_content "You have signed up successfully."
    expect(page).to have_content "Nine to Five Guys"
  end
end
