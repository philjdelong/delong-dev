require 'rails_helper'

RSpec.describe "As a user" do
	describe "when i visit the home page", type: :feature do
		before :each do
			visit "/"
		end

		it "i see a profile image" do
			expect(page).to have_css("#profile_image")
		end

		it "i see a nav with home about background education" do
			expect(page).to have_link('projects')
			expect(page).to have_link('education')
			expect(page).to have_link('career')
			expect(page).to have_link('calendar')
		end
	end
end