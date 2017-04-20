require "rails_helper"

feature "user visits the index page" do
  scenario "user visits root page to sign up or log in" do
    visit root_path
    expect(page).to have_content "Sign Up"  #might bee expect link Sign_up
    expect(page).to have_content "Log In"  #might bee expect link Sign_up
  end

  scenario "user tries to sign up" do
    visit root_path
    click_link "Sign Up"
    expect(page).to have_content "Email"
    expect(page).to have_content "Password (6 characters minimum)"
    expect(page).to have_content "Password confirmation"

  end

  scenario "user tries to log in" do
    visit root_path
    click_link "Log In"
    expect(page).to have_content "Email"
    expect(page).to have_content "Password"
  end
end
