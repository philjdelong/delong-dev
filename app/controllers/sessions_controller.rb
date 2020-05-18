class SessionsController < ApplicationController
	def new
	end
	
	def create
		user = User.find_by(email: params[:email])
		if user && user.authenticate(params['password'])
			session[:user_id] = user.id
			flash[:success] = "Signed in as #{user.username}!"
			redirect_to "/"
		else
			flash[:error] = "Username or Password not found. Please try again."
			redirect_to "/login"
		end
	end
	
	def delete
		flash[:success] = "Logged Out."
		session.destroy
		redirect_to "/"
	end
end