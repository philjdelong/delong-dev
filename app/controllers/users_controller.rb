class UsersController < ApplicationController
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

	def show
		if current_user.admin?
			@users = User.all
		end
	end

	def edit
	end

	def update
		if params["username"].length == 0 || params["email"].length == 0
			flash[:error] = "Please complete all fields"
			redirect_to "/#{current_user.slug}/edit"
		else
			current_user.update(update_params)
			if current_user.save
				flash[:success] = "Info successfully updated!"
				redirect_to "/#{current_user.slug}"
			else
				flash[:error] = "Please try again"
				redirect_to "/#{current_user.slug}/edit"
			end
		end
	end

	private

	def user_params
		params.permit(:username, :email, :password, :password_confirmation)
	end
	
	def update_params
		params.permit(:username, :email)
	end
end