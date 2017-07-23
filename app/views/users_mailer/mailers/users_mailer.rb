class UsersMailer < ApplicationMailer
  default from: "notifications@example.com"

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: "Welcome to Odin Facebook")
  end
end
