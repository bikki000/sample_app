class UserMailer < ApplicationMailer
	default from: 'tnvr000@gmail.com'

	def welcome_email(user = nil)
		@user = user || current_user
		@url = 'http://localhost:3000/signin'
		mail(to: @user.email, subject: 'Welcome to my awesome world')
	end
end
