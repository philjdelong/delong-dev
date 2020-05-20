require 'rails_helper'

RSpec.describe "As a user", type: :feature do
	describe "when i visit my profile page" do
		before :each do
			user = User.create(
				username: "user",
				email: "example@email.com",
				password: "password",
				password_confirmation: "password",
				role: 1
			)

			allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

			visit "/#{user.slug}/profile"
		end

		it "i see username and email" do 
			expect(page).to have_content("Profile:")
			expect(page).to have_content("user")
			expect(page).to have_content("example@email.com")
		end
	end
end