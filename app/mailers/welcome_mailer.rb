class WelcomeMailer < ApplicationMailer

  def welcome(user)
    @user = user
    mail(to: @user.email, subject: "Let's be magicians!")
  end
end
