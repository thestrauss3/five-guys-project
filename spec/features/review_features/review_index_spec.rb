require "rails_helper"

feature "User visits the review index page" do
  let (:wendys) { Restaurant.create(name: "Wendys", location: "Boston", dining_type: "Might be a selction", description: "Really long lines and really long text", hours: "10am-10pm") }
  let (:baconator) { Burger.create name: "baconator", description: "lots of bacon", restaurant: wendys }
  let (:first_review) { Review.create burger: baconator, burger_rating: 4, body: "This burger is full of bacon... AWESOME!!" }
  let (:best_review) { Review.create burger: baconator, burger_rating: 5, body: "THIS IS THE BEST BURGER I'VE EVER HAD!!" }
  let (:highest_rated_review) { Review.create burger: baconator, burger_rating: 4, body: "This burger makes Wendy's awesome", review_rating: 1 }

  scenario "User sees all the reviews for a particular burger" do
    wendys
    baconator
    first_review
    best_review
    highest_rated_review

    visit burger_reviews_path(baconator)

    expect(page).to have_content "This burger is full of bacon... AWESOME!!"
    expect(page).to have_content "THIS IS THE BEST BURGER I'VE EVER HAD!!"
    expect(page).to have_content "This burger makes Wendy's awesome"
    expect(page).to have_content "Burger rating: 5"
    expect(page).to have_content "Burger rating: 4"
  end

  xscenario "User can sort reviews by newest, highest rated, most upvotes" do
  end
end
