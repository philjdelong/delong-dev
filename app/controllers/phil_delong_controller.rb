class PhilDelongController < ApplicationController
	def about
	end

	def career
	end

	def education
	end

	def pdf
		resume = File.join(Rails.root, "app/assets/images/delong_resume.pdf")
		# inserting 'disposition' below renders the image, removing 'disposition will download the file immediately'
		send_file(resume, :filename => "delong_resume.pdf", :disposition => 'inline', :type => "application/pdf")
	end

	def game
		if current_user
			@game = Game.find_by(user_id: current_user.id)
		end
	end
end