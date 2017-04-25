require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "signup_confirmation" do

    let!(:user) do
      User.create(email: "925guys@gmail.com", password: "password", first_name: "925", last_name: "guys", username: "925-guys")
    end
    let!(:mail) { UserMailer.signup_confirmation(user) }

    it "renders the headers" do
      expect(mail.subject).to eq("Sign Up Confirmation")
      expect(mail.to).to eq(["925guys@gmail.com"])
      expect(mail.from).to eq(["nine2fiveguys@gmail.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Thank you for signing up.")
    end
  end

end
