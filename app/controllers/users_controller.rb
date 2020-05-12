class UsersController < ApplicationController
	def new
	end

	def create
		user = User.create(user_params)
		user.save
		if user.save
			session[:user_id] = user.id
			redirect_to "/"
		else
			redirect_to "/register"
		end
	end

	private

	def user_params
		params.permit(:username, :email, :password)
	end
end