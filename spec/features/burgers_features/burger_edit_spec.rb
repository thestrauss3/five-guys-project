require "rails_helper"

feature "user visits edit page" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:restaurant) { FactoryGirl.create(:restaurant) }
  let!(:burger) {FactoryGirl.create(:burger, restaurant: restaurant, user: user)}

  scenario "logged in user edits a burger from their burger submissions list and is redirected to an updated version of that burger's show page" do
    login_as(user, :scope => :user)
    visit user_path(user)


      click_link ("Edit This Burger Submission")
      visit edit_burger_path(burger)
      fill_in 'Name', with: "Double Garlic Steak Burger"
      fill_in 'Price', with: 4
      fill_in 'Description', with: "This burger is so good, you will want to eat five of them!"
      click_button 'Update Burger'

      expect(page).to have_current_path(burger_path(burger))
      burger = Burger.find_by(name: "Double Garlic Steak Burger")
      expect(page).to have_content "Burger successfully edited!"
      expect(page).to have_content "Double Garlic Steak Burger"
  end

  scenario "Logged in user sees a form to edit burger information" do
    login_as(user, :scope => :user)
    visit edit_burger_path(burger)
    expect(page).to have_content "Edit burger submission"
    expect(page).to have_xpath "//input"
  end

  scenario "Logged-in User does not provide valid information for editing a burger" do
    login_as(user, :scope => :user)
    visit edit_burger_path(burger)
    fill_in 'Name', with: ""
    fill_in 'Description', with: ""
    click_button 'Update Burger'

    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Description can't be blank"
  end

end
