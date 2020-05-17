require 'rails_helper'

RSpec.describe "As a user", type: :feature do
	describe "when i visit the dashboard" do
		it "i can edit all of my information" do
			username = "phil"
			email = "example@email.com"
			password = "password"
	
			user = User.create(
				username: username,
				email: email,
				password: password,
				password_confirmation: password
			)

			visit "/"

			click_link "login"

			fill_in "username:", with: username
			fill_in "password:", with: password

			click_button "Login"
			expect(current_path).to eq("/")

			click_link "Dashboard"
			expect(current_path).to eq("/#{user.slug}")

			click_link "Edit"
			expect(current_path).to eq("/#{user.slug}/edit")
			expect(current_path).to eq("/#{user.slug}/edit")
			
			fill_in "email:", with: "new@email.com"
			fill_in "username:", with: "New Username"
			
			click_button "Update"
			
			expect(current_path).to eq("/#{user.slug}")

			expect(user.email).to eq("new@email.com")
			expect(user.username).to eq("New Username")

			within('nav') do
				expect(page).to have_content("Welcome, New Username")
			end

			visit "/"

			within('nav') do
				expect(page).to have_content("Welcome, New Username")
			end
		end
	end
end