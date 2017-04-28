require "rails_helper"

feature "User visits restaurant index page" do
  let!(:restaurant1) { FactoryGirl.create(:restaurant) }
  let!(:restaurant2) do
    FactoryGirl.create(:restaurant,
      name: "Wendy's",
      description: "Home of the awesome baconator!")
  end
  let!(:burger1_owner) {FactoryGirl.create(:user) }
  let!(:burger2_owner) {FactoryGirl.create(:user, email: '925guys@gmail.com') }
  let!(:burger1) do
    FactoryGirl.create(:burger,
      restaurant: restaurant1,
      user: burger1_owner)
  end
  let!(:burger2) do
    FactoryGirl.create(:burger,
      restaurant: restaurant2,
      user: burger2_owner)
  end

  scenario "User sees a list of all restaurants" do
    visit restaurants_path
    expect(page).to have_content("Restaurant List")
    expect(page).to have_content(restaurant1.name)
    expect(page).to have_content(restaurant2.name)
  end

  scenario "User can click a restaurant to go to the page for that restaurant" do
    visit restaurants_path
    click_link restaurant1.name
    expect(page).to have_content restaurant1.description
  end
end
