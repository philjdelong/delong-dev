require 'rails_helper'

RSpec.describe "As a user" do
	describe "when i visit projects", type: :feature do
		before :each do
			visit "/"
			click_link "Projects"
		end

		it "i still see nav" do
			expect(page).to have_css("#profile_image")
		end

		it "i see Projects heading" do
			expect(page).to have_content("Projects")
		end

		it "i see a list of projects with links to repo" do
			expect(page).to have_css("#projects")
			expect(page).to have_link("GameOn")
			expect(page).to have_link("InkTank")
			expect(page).to have_link("Sweater Weather")
			expect(page).to have_link("Brownfield of Dreams")
		end
	end
end