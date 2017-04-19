require "rails_helper"

feature "User visits new review page" do
  scenario "User sees a form to enter review information" do
    wendys = Restaurant.create(name: "Wendys", location: "Boston", dining_type: "Might be a selction", description: "Really long lines and really long text", hours: "10am-10pm")
    baconator = Burger.create name: "baconator", description: "lots of bacon", restaurant: wendys
    visit new_burger_review_path(baconator)
    expect(page).to have_content "Add a new review"
    expect(page).to have_xpath "//input"
    binding.pry
    fill_in "Rating", with: "5"

    fill_in 'Body', with: "This burger.. its so good. i eat a lot"
    click_button 'Submit Review'
    expect(page).to have_current_path(review_path(Review.find_by(body: "This burger.. its so good. i eat a lot")))
    expect(page).to have_content "This burger.. its so good. i eat a lot"
  end
end
