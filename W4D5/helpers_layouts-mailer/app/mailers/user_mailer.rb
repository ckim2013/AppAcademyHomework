class UserMailer < ApplicationMailer
  default from: 'everybody@example.com'

  def welcome_email(user)
    @user = user
    @url = 'http://localhost:3000/session/new'
    mail(to: user, subject: 'Welcome to my awesome site!')
  end
end
