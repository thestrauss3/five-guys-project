require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  let(:user) do
    User.create(email: "925guys@gmail.com", password: "password", first_name: "925", last_name: "guys", username: "925-guys")
  end
  let(:not_user) { User.create(password: "1") }
  let(:confirmation_mail) { UserMailer.signup_confirmation(user) }
  let(:no_confirmation_mail) { UserMailer.signup_confirmation(not_user) }

  context "User successfully signs up" do
    it "Renders the headers" do
      expect(confirmation_mail.subject).to eq("Sign Up Confirmation")
      expect(confirmation_mail.to).to eq(["925guys@gmail.com"])
      expect(confirmation_mail.from).to eq(["nine2fiveguys@gmail.com"])
    end


    it "Renders the body" do
      expect(confirmation_mail.body.encoded).to match("Thank you for choosing 925 guys!")
    end
  end
  context "User unsuccessfully tries to sign up" do
    it "Does not send an email" do
      expect(no_confirmation_mail.subject).to eq nil
    end
  end
end
