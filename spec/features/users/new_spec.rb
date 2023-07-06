require 'rails_helper'

RSpec.describe "New User", type: :feature do
  before(:each) do
    @user1 = User.create!(name: "Jim Bob", email: "Jbob@somewhere.com")
    @user2 = User.create!(name: "Tim Timson", email: "Ttimmer@hotmail.com")
    @user3 = User.create!(name: "Google Guy", email: "Google@gmail.com")
  end

  describe "When I visit the /register path" do
    it "I see a form to register a new user" do
      visit '/register'
      expect(page).to have_content("New User")
      expect(page).to have_field("Name:")
      expect(page).to have_field("Email:")
      expect(page).to have_button("Register")
    end

    it "click button and redirect to spcific user's dashboard" do
      visit '/register'
      fill_in "Name:", with: "Ace Ventura"
      fill_in "Email:", with: "ace@turing.edu"
      click_button "Register"
    
      user = User.last
      expect(page).to have_current_path("/users/#{user.id}")
    end

    it "must have unique email address" do
      visit '/register'
      fill_in "Name:", with: "Ace Ventura"
      fill_in "Email:", with: "Jbob@somewhere.com"
      click_button "Register"
      user = User.last

      expect(page).to_not have_current_path("/users/#{user.id}")
      expect(page).to have_content("Email already exists. Please try again.")
      expect(page).to have_current_path("/register")

    end
  end
end

