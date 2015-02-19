class UserMailer < ApplicationMailer
  default from: 'Testing@example.com'

  def send_activation_email user
    @user = user
    @url = activate_user_url + "?activation_token=#{@user.activation_token}"
    mail(to: user.email, subject: 'Welcome, Please Activate your Email')
  end
end
