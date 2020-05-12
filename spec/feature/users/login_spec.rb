require 'rails_helper'

RSpec.describe "As a user", type: :feature do
	it "i can login" do
		User.create(
			username: "philjdelong", 
			email: "philjdelong@gmail.com",
			password: "password"
		)
		
		username = "philjdelong"
		password = "password"

		visit "/"

		within('#user_session') do
			fill_in "username", with: username
			fill_in "password", with: password
			click_button "login / register"
			expect(current_path).to eq("/")
		end

		expect(page).to have_content("Welcome, #{username}!")
	end
end