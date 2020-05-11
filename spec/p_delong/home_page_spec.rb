require 'rails_helper'

RSpec.describe "As a user" do
	describe "when i visit the home page", type: :feature do
		before :each do
			visit "/"
		end

		it "i see a profile image" do
			expect(page).to have_css(".profile_image")
		end

		it "i see a nav with three links" do
			expect(page).to have_link('Home')
			expect(page).to have_link('Projects')
			expect(page).to have_link('Resume')
		end

		it "i see About heading and Early Childhood Career and Meet the Gang sub-headings" do
			expect(page).to have_content("About")
			expect(page).to have_content("Childhood and Education")
			expect(page).to have_content("Career")
			expect(page).to have_content("Transition into Software")
			expect(page).to have_content("Meet the Gang")
		end
	end
end