require 'rails_helper'

RSpec.describe "As a user", type: :feature do
	describe "when i visit the dashboard" do
		it "i can edit all of my information" do
			username = "user"
			email = "user@email.com"
			password = "password"
	
			user = User.create(
				username: username,
				email: email,
				password: password,
				password_confirmation: password
			)

			allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

			visit "/"
			
			click_link "Dashboard"
			expect(current_path).to eq("/#{user.slug}/profile")

			click_link "Edit"
			expect(current_path).to eq("/#{user.slug}/edit")
			
			fill_in "email:", with: "new@email.com"
			fill_in "username:", with: "New User"
			fill_in "password:", with: password
			fill_in "password confirmation:", with: password
		
			click_button "Update"
			expect(current_path).to eq("/#{user.slug}/profile")
			
			user.reload
			expect(user.email).to eq("new@email.com")
			expect(user.username).to eq("New User")

			expect(page).to have_content("Your information has been updated")
		end
	end
end