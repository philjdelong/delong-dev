require 'rails_helper'

RSpec.describe "As a user" do
	describe "when i visit resume", type: :feature do
		before :each do
			visit "/"
			click_link "Resume"
		end

		# need to update test to look within JS CSS
		xit "i still see nav" do
			expect(page).to have_css("#profile_image")
		end

		it "i see Resume heading" do
			expect(page).to have_content("Resume")
		end

		it "i see an embedded resume" do
			expect(page).to have_css("#resume")
		end
	end
end