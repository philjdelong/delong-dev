class ApplicationController < ActionController::Base
	helper_method :current_user
	add_flash_types :info, :error, :message

	def current_user
		user ||= User.find(session[:user_id]) if session[:user_id]
	end
end
