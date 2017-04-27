require "rails_helper"

feature "user views homepage" do
  scenario "users sees title and list of top burgers" do
    visit root_path
    expect(page).to have_content "Top Rated Burgers"
    expect(page).to have_content "Try a Random Burger"
  end
end
