class UsersController < ApplicationController
	def new
	end

	def create
		user = User.create(user_params)
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
		user = User.find(current_user.id)
		user.update(update_params)
		if user.save
			redirect_to "/#{user.slug}"
		else
			flash[:error] = "Update unsuccessful"
			redirect_to "/#{user.slug}/edit"
		end
	end

	def delete
		user = User.find(current_user.id)
		user.destroy
		session.destroy
		flash[:success] = "Profile successfully deleted."
		redirect_to "/"
	end

	private

	def user_params
		params.permit(:username, :email, :password, :password_confirmation)
	end
	
	def update_params
		params.permit(:username, :email)
	end
end