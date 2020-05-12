require 'rails_helper'

RSpec.describe "As a new user", type: :feature do
	it "i can register" do
		username = "philjdelong"
		email = "philjdelong@gmail.com"
		password = "password"

		visit "/"

		fill_in "username", with: "philjdelong"
		fill_in "password", with: "password"
		click_button "login / register"
		expect(current_path).to eq("/register")

		expect(page).to have_content("Registration")

		within(".description") do
			fill_in "username:", with: username
			fill_in "email:", with: email
			fill_in "password:", with: password
			fill_in "confirm password:", with: password
			click_button "Register"
		end
		
		expect(current_path).to eq("/")
		expect(User.all.count).to eq(1)

		within("#user_session") do
			expect(page).to have_content("Welcome, #{username}!")
		end
	end
end