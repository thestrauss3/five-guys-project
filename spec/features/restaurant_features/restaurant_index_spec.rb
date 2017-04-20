require "rails_helper"

feature "User visits restaurant index page" do
  scenario "User sees a list of all restaurants" do
    restaurant1 = Restaurant.create(name: "Five guys", location: "Boston", dining_type: "Might be a selction ", description: "Really awesome food Filler text Filler text Filler text Filler text Filler text Filler text Filler text Filler text Filler text", hours: "9am-9pm")
    restaurant2 = Restaurant.create(name: "Wendys", location: "Boston", dining_type: "Fast Food", description: "square burgers Filler text Filler text Filler text Filler text Filler text Filler text Filler text Filler text Filler text", hours: "24/7")

    visit restaurants_path
    expect(page).to have_content("Restaurant List")

    expect(page).to have_content(restaurant1.name)
    expect(page).to have_content(restaurant2.name)
  end

  scenario "User can click a restaurant to go to the page for that restaurant" do
    restaurant1 = Restaurant.create(name: "Five guys", location: "Boston", dining_type: "Might be a selction ", description: "Really awesome food Filler text Filler text Filler text Filler text Filler text Filler text Filler text Filler text Filler text", hours: "9am-9pm")
    visit restaurant_path(restaurant1)
    expect(page).to have_content "Really awesome food Filler text Filler text Filler text Filler text Filler text Filler text Filler text Filler text Filler text"
  end
end
