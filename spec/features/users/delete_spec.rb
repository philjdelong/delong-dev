require 'rails_helper'

RSpec.describe "As a user", type: :feature do 
	describe "when i visit my profile page" do
		it "i can delete my profile" do
			user = User.create(
				username: "user",
				email: "email",
				password: "pass",
				password_confirmation: "pass"
			)

			allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

			visit "/#{user.slug}/profile"

			click_link "Delete Profile"
			expect(current_path).to eq("/")
			
			expect(User.count).to eq(0)
		end
	end
end