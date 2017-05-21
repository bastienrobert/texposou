class UserNotifierMailer < ApplicationMailer
  default :from => 'mail@texposou.fr'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_signup_email()
    @user = User.find_by(email:"solal.dussout-revel@hotmail.fr")
    mail( :to => "solal.dussoutrevel@gmail.com",
      :from => 'Test <mail@appec3942f92493499aaeefc8d3ebbac058.mailgun.org>',
      :subject => 'Thanks for signing up for our amazing app'
    ).deliver
  end

  # def send_signup_email(user)
  #   # email = mail from: 'mail@texposou.fr', to: user.email, subject: 'this is an email'
  # end
end
