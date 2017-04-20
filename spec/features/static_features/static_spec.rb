require "rails_helper"

feature "user views homepage" do
  scenario "users sees title and list of top burgers" do
    visit root_path
    expect(page).to have_content "Nine to Five Guys"
    expect(page).to have_content "Nine Burgers to Know"
  end
end
