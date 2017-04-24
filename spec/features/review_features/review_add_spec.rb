require "rails_helper"

feature "User visits the new review page" do
  let!(:restaurant) { FactoryGirl.create(:restaurant) }
  let!(:user) {FactoryGirl.create(:user) }
  let!(:burger) { FactoryGirl.create(:burger, restaurant: restaurant) }
  let!(:review1) {FactoryGirl.create(:review, burger: burger, user: user) }

  feature "User visits the review page" do
    scenario "Logged in user sees a form to enter review information" do
      login_as(user, :scope => :user)
      visit new_burger_review_path(burger)

      expect(page).to have_content "Add a new review"
      expect(page).to have_xpath "//input"
    end
    scenario "User is not logged in and tries to visit add review page" do
      visit new_burger_review_path(burger)
      expect(page).to have_content "Please log in before trying to submit a review!"
      expect(page).to_not have_content "Add a review"
    end
  end

  feature "User submits a review" do
    scenario "User successfully submits a review" do
      login_as(user, :scope => :user)
      visit new_burger_review_path(burger)

      fill_in "Rating", with: "5"
      fill_in 'Body', with: "This burger.. its so good. i eat a lot"
      click_button 'Submit Review'

      expect(page).to have_content "Review submitted successfully"
      expect(page).to have_current_path(burger_reviews_path(burger))
      # save_and_open_page
      expect(page).to have_content "This burger.. its so good. i eat a lot"
    end

    feature "User unsuccessfully submits a review" do
      scenario "User does not provide enough information" do
        login_as(user, :scope => :user)
        visit new_burger_review_path(burger)
        click_button 'Submit Review'

        expect(page).to have_content "Burger rating can't be blank"
        expect(page).to have_content "Body can't be blank"
        expect(page).to have_content "Burger rating must be between 1 - 5"
        expect(page).to have_content "Body of review must be 20 characters"
      end

      scenario "User provides invalid information" do
        login_as(user, :scope => :user)
        visit new_burger_review_path(burger)

        fill_in "Rating", with: "6"
        fill_in "Body", with: "Pie"
        click_button "Submit Review"

        expect(page).to have_content "Burger rating must be between 1 - 5"
        expect(page).to have_content "Body of review must be 20 characters"
      end
    end
  end
end
