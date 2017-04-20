require "rails_helper"

feature "User visits a specific restaurant page" do
  let(:five_guys) { Restaurant.create(name: "Five guys", location: "Boston", dining_type: "Might be a selction", description: "Really awesome food. Filler text Filler text Filler text Filler text Filler text Filler text Filler text Filler text Filler text", hours: "9am-9pm") }
  let(:wendys) { Restaurant.create(name: "Wendys", location: "Boston", dining_type: "Fast Food", description: "square burgers Filler text Filler text Filler text Filler text Filler text Filler text Filler text Filler text Filler text", hours: "24/7") }
  scenario "User can click on the name of a restaurant to go to its page" do
    five_guys
    visit restaurant_path(five_guys)

    expect(page).to have_content(five_guys.name)
    expect(page).to have_content(five_guys.location)
    expect(page).to have_content(five_guys.dining_type)
    expect(page).to have_content(five_guys.description)
    expect(page).to have_content(five_guys.hours)
  end

  scenario "User should see a list of burgers belonging to that restaurant" do
    five_guys
    wendys
    Burger.create name: "baconator", description: "lots of bacon and lots of text", restaurant: wendys, image_url: "baconator.jpg"
    Burger.create name: "Five Guys' Burger", description: "Best of the best extra text for length", restaurant: five_guys

    visit restaurant_path(wendys)

    expect(page).to have_content "baconator"
    expect(page).to_not have_content "Five Guys' Burger"
  end

  scenario "User should be able to click a burger to see more information about that burger" do
    five_guys
    wendys
    baconator = Burger.create name: "baconator", description: "lots of bacon and lots of text", restaurant: wendys, image_url: "baconator.jpg"

    visit restaurant_path(wendys)

    click_link baconator.name

    expect(page).to have_content "lots of bacon and lots of text"
  end
end
