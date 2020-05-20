require 'rails_helper'

RSpec.describe "As a user", type: :feature do
	it "i can login" do
		username = "user"
		email = "email@email.com"
		password = "password"

		user = User.create(
			username: username, 
			email: email,
			password: password,
			password_confirmation: password,
		)

		visit "/"

		within('#user_session') do
			click_link "login"
		end
		expect(current_path).to eq("/login")
		
		fill_in "email", with: email
		fill_in "password", with: password
		click_button "Login"
		expect(current_path).to eq("/")
		
		expect(page).to have_content("Welcome, #{username}!")
	end
end