class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by(email: params[:sessions][:email])
		if user && user.authenticate(params[:sessions][:password])
			# sign the user in and redirect to the user's show page.
		else
			flash.now[:danger] = "Invalid email/password combination"
			render 'new'
			# create an error message and re-render the sign page
		end
	end

	def destroy
	end
end
