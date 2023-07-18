require 'rails_helper'

RSpec.describe "New User", type: :feature do
  # before(:each) do
  #   @user1 = User.create!(name: "Jim Bob", email: "Jbob@somewhere.com")
  #   @user2 = User.create!(name: "Tim Timson", email: "Ttimmer@hotmail.com")
  #   @user3 = User.create!(name: "Google Guy", email: "Google@gmail.com")
  # end

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
      fill_in "Password:", with: "apples"
      fill_in "Password Confirmation:", with: "apples"

      click_button "Register"
    
      user = User.last
      expect(page).to have_current_path("/users/#{user.id}")
    end

    context "when a user has already been registered with that email address" do
      let!(:user1) do
        User.create!(
          email: "Jbob@somewhere.com",
          name: "Jim Bob",
          password: "apples",
          password_confirmation: "apples"
        )
      end

        it "must have unique email address" do
            visit '/register'
            fill_in "Name:", with: "Ace Ventura"
            fill_in "Email:", with: "Jbob@somewhere.com"
            fill_in "Password:", with: "apples"
            fill_in "Password Confirmation:", with: "apples"
            click_button "Register"
            user = User.last
            
            expect(page).to_not have_current_path("/users/#{user.id}")
            expect(page).to have_content("Email already exists. Please try again.")
            expect(page).to have_current_path("/register")
            
          end
        end
    
    context "when password/confirmation dont match" do
      let!(:user1) do
        User.create!(
          email: "ace@turing.edu",
          name: "Jim Bob",
          password: "apples",
          password_confirmation: "apples"
        )
      end
      it "click button and see flash messege for mismatching passwords" do
        visit '/register'
        fill_in "Name:", with: "Ace Ventura"
        fill_in "Email:", with: "jimbob@turing.edu"
        fill_in "Password:", with: "apples"
        fill_in "Password Confirmation:", with: "oranges"
  
        click_button "Register"
      
        expect(page).to have_current_path("/register")
        expect(page).to have_content("Passwords do not match. Please try again.")
      end

      it "click button and see flash message for both mismatching passwords & non-unique email" do
        visit '/register'
        fill_in "Name:", with: "Ace Ventura"
        fill_in "Email:", with: "ace@turing.edu"
        fill_in "Password:", with: "apples"
        fill_in "Password Confirmation:", with: "oranges"
  
        click_button "Register"
      
        expect(page).to have_current_path("/register")
        expect(page).to have_content("Email already exists. Passwords do not match. Please try again.")
      end
    end
  end
end

