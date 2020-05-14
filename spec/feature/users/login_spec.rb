require 'rails_helper'

RSpec.describe "As a user", type: :feature do
	it "i can login" do
		User.create(
			username: "user", 
			email: "user@email.com",
			password: "password",
			password_confirmation: "password",
		)
		
		username = "user"
		password = "password"

		visit "/"

		within('#user_session') do
			click_link "login"
		end
		expect(current_path).to eq("/login")
		
		fill_in "username", with: username
		fill_in "password", with: password
		click_button "Login"
		expect(current_path).to eq("/")
		

		expect(page).to have_content("Welcome, #{username}!")
	end
end