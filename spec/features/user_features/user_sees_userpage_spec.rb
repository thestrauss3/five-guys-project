require "rails_helper"

feature "user sees the things on their user page" do
  let!(:user1) { FactoryGirl.create(:user) }
  let!(:restaurant) { FactoryGirl.create(:restaurant) }
  let!(:burger1) do
    FactoryGirl.create(:burger,
      restaurant: restaurant,
      image_url: nil,
      name: "Just another burger",
      user: user1)
    end

  let!(:burger2) do
    FactoryGirl.create(:burger,
          restaurant: restaurant,
          user: user1)
  end

  scenario "user can visit userspage through clicking on username" do
    login_as(user1, :scope => :user)
    visit root_path
    click_link user1.username
    expect(page).to have_content "My Burger Submissions"
    expect(page).to have_content "My Burger Reviews"
    expect(page).to have_link user1.burgers.first.name
    expect(page).to have_link user1.burgers.second.name

  end
end
