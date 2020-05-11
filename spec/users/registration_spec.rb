require 'rails_helper'

RSpec.describe "As a new user", type: :feature do
	it "i can register" do
		visit "/"

		fill_in "email", with: "philjdelong@gmail.com"
		fill_in "password", with: "password"
		click_button "login / register"
		expect(current_path).to eq("/register")

		expect(page).to have_content("Please complete the form to complete registration.")

		fill_in "name", with: "Phil"
		fill_in "password", with: "password"
		fill_in "confirm password", with: "password"
		click_button "Register"
		expect(current_path).to eq("/")

		expect(page).to have_content("Welcome, Phil!")
	end
end