require "rails_helper"

feature "User views a burger index page" do
  let!(:restaurant1) { FactoryGirl.create(:restaurant) }
  let!(:restaurant2) { FactoryGirl.create(:restaurant) }
  let!(:burger1_owner) {FactoryGirl.create(:user) }
  let!(:burger2_owner) {FactoryGirl.create(:user, email: '925guys@gmail.com') }
  let!(:burger1) do
    FactoryGirl.create(:burger,
    restaurant: restaurant1,
    name: "The Beast Burger",
    user: burger1_owner) 
  end
  let!(:burger2) do
    FactoryGirl.create(:burger,
      restaurant: restaurant2,
      name: "Awesome burger",
      user: burger2_owner)
  end

  scenario "User visits the overall burger index" do
    visit burgers_path

    expect(page).to have_content "All Burgers:"
    expect(page).to have_content burger1.name
    expect(page).to have_content burger2.name
  end
end
