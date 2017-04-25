class UserMailer < ApplicationMailer
  default from: "nine2fiveguys@gmail.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signup_confirmation.subject
  #
  def signup_confirmation(user)
    @user = user
    if @user.persisted?
      mail to: user.email, subject: "Sign Up Confirmation"
    end
  end

  def review_added(user, burger, review)
    @user = user
    @burger = burger
    @review = review

    mail to: user.email, subject: "A review has been added to your burger"
  end
end
