require 'rails_helper'

RSpec.describe "As a new user", type: :feature do
	it "i can register" do
		click_link "Register/Login"
		expect(current_path).to eq("/login")
	

		expect(page).to have_link("Register")

		fill_in "email", with: "philjdelong@gmail.com"
		click_button "Login"
		expect(current_path).to eq("/registration")
		expect(page).to have_content("No email found, please complete the form to register.")

		fill_in "name", with: "Phil"
		fill_in "password", with: "password"
		fill_in "confirm password", with: "password"
		click_button "Register"
		expect(current_path).to eq("/")

		expect(page).to have_content("Welcome, Phil!")
	end
end