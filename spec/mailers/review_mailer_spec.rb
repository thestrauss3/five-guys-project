require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  let!(:burger_owner) do
    User.create(email: "925guys@gmail.com", password: "password", first_name: "925", last_name: "guys", username: "925-guys")
  end
  let!(:rest) { FactoryGirl.create(:restaurant) }
  let!(:burger) { FactoryGirl.create(:burger, restaurant: rest, user: burger_owner) }
  let!(:review_owner) { FactoryGirl.create(:user) }
  let!(:review) { FactoryGirl.create(:review, user: review_owner, burger: burger) }
  let!(:mail) { UserMailer.review_added(burger_owner, burger, review) }

  describe "A user leaves a new review on an burger" do
    context "Sends an email alert to the owner of the burger" do
      it "The email should be sent to the burger owner" do
        expect(mail.to).to eq([burger_owner.email])
        expect(true).to eq true
      end
      it "The email should be sent from nine2fiveguys@gmail.com" do
        expect(mail.from).to eq(["nine2fiveguys@gmail.com"])
      end
      it "The email should have a link to the burger show page" do
        expect(mail.body.encoded).to have_content(burger.name)
      end
      it "The email should have a link to the review index page for the burger" do
        expect(mail.body.encoded).to have_content("See all the reviews")
      end
      it "The email should include the username of the review owner" do
        expect(mail.body.encoded).to have_content(review_owner.username)
      end
      it "The email should include the body of the review" do
        expect(mail.body.encoded).to have_content(review.body)
      end
    end
  end
end
