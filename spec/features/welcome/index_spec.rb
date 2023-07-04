require 'rails_helper'

RSpec.describe "Landing Page", type: :feature do
  before(:each) do
    @user1 = User.create!(name: "Jim Bob", email: "Jbob@somewhere.com")
    @user1 = User.create!(name: "Tim Timson", email: "Ttimmer@hotmail.com")
    @user1 = User.create!(name: "Google Guy", email: "Google@gmail.com")
  end

  describe "When I visit the Landing Page '/'" do
    it "I see the title of the Application" do
      visit '/'
      expect(page).to have_content("Viewing Party!")
    end

    it "Has a button to create a new user" do
      visit '/'
      
      within "#new_user" do
        expect(page).to have_button("Create a New User")
        click_button("Create a New User")
      end
      expect(current_path).to eq('/register')
    end
  end
end