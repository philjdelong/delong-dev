class UsersController < ApplicationController
	def show
		if current_user.admin?
			@users = User.all
		end
	end
	
	def new
	end

	def create
		user = User.create(user_params)
		user.save
		if user.save
			flash[:success] = "Registration complete!"
			session[:user_id] = user.id
			redirect_to "/"
		else
			flash[:error] = "Please try again."
			redirect_to "/register"
		end
	end

	private

	def user_params
		params.permit(:username, :email, :password, :password_confirmation)
	end
end