require 'rails_helper'

RSpec.describe "As a new user", type: :feature do
	it "i can register" do
		User.destroy_all
		username = "username"
		email = "email@gmail.com"
		password = "password"

		visit "/"

		click_link "register"
		expect(current_path).to eq("/users/register")

		expect(page).to have_content("Register:")

		within(".description") do
			fill_in "username", with: username
			fill_in "email", with: email
			fill_in "password", with: password
			fill_in "confirm password", with: password
			click_button "Register"
		end
		expect(current_path).to eq("/")

		expect(User.all.count).to eq(1)
	end
end