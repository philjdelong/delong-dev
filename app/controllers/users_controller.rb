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
			redirect_to "/users/register"
		end
	end

	def profile
		if current_user.admin?
			@users = User.all
		end
	end

	def edit
		@user = User.find(current_user.id)
	end
	
	def update
		user = User.find(current_user.id)
		user.update(user_params)
		if user.save
			flash[:success] = "Your information has been updated"
			redirect_to "/#{user.slug}/profile"
		else
			flash[:error] = "Please enter valid information"
			redirect_to "/#{user.slug}/edit"
		end
	end

	def delete
		user = User.find_by(slug: params[:slug])
		unless current_user.admin?
			session.destroy
		end
		flash[:success] = "#{user.username} successfully deleted."
		user.destroy
		redirect_to "/"
	end

	private

	def user_params
		params.permit(:username, :email, :password, :password_confirmation, :lifetime_wins, :lifetime_losses)
	end
end