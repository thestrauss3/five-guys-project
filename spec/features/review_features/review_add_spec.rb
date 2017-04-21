require "rails_helper"

feature "User visits the new review page" do
  let (:wendys) { Restaurant.create(
                    name: "Wendys",
                    location: "Boston",
                    dining_type: "Might be a selction",
                    description: "Really long lines and really long text",
                    hours: "10am-10pm") }
  let (:baconator)  { Burger.create(
                        name: "baconator",
                        description: "lots of bacon and lots of text",
                        restaurant: wendys) }

  feature "User visits the review page" do
    scenario "User sees a form to enter review information" do
      baconator
      visit new_burger_review_path(baconator)
      expect(page).to have_content "Add a new review"
      expect(page).to have_xpath "//input"
    end
  end

  feature "User submits a review" do
    scenario "User successfully submits a review" do
      baconator
      visit new_burger_review_path(baconator)
      fill_in "Rating", with: "5"
      fill_in 'Body', with: "This burger.. its so good. i eat a lot"
      click_button 'Submit Review'
      expect(page).to have_content "Review submitted successfully"
      expect(page).to have_current_path(burger_path(baconator))
      expect(page).to have_content "This burger.. its so good. i eat a lot"
    end

    feature "User unsuccessfully submits a review" do
      scenario "User does not provide enough information" do
        baconator
        visit new_burger_review_path(baconator)
        click_button 'Submit Review'
        expect(page).to have_content "Burger rating can't be blank"
        expect(page).to have_content "Body can't be blank"
        expect(page).to have_content "Burger rating must be between 1 - 5"
        expect(page).to have_content "Body of review must be 20 characters"
      end

      scenario "User provides invalid information" do
        visit new_burger_review_path(baconator)
        fill_in "Rating", with: "6"
        fill_in "Body", with: "Pie"
        click_button "Submit Review"
        expect(page).to have_content "Burger rating must be between 1 - 5"
        expect(page).to have_content "Body of review must be 20 characters"
      end
    end
  end
end
