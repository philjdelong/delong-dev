require 'rails_helper'

RSpec.describe "As a user", type: :feature do
	it "i can login" do
		click_link "Register / Login"
		fill_in "email", with: "philjdelong@gmail.com"
		expect(current_path).to eq("/confirm")

		fill_in "password", with: "password"
		click_button "Login"
		expect(current_path).to eq("/")
		expect(page).to have_content("Welcome, Phil!")
	end
end