require 'rails_helper'

RSpec.describe "Landing Page", type: :feature do
  before(:each) do
    @user1 = User.create!(name: 'Jim Bob', email: 'Jbob@somewhere.com', password: '123', password_confirmation: '123')
    @user2 = User.create!(name: 'Tim Timson', email: 'Ttimmer@hotmail.com', password: '456', password_confirmation: '456')
    @user3 = User.create!(name: 'Google Guy', email: 'Google@gmail.com', password: '789', password_confirmation: '789')
  end

  describe "When I visit the Landing Page '/'" do
    it "I see the title of the Application" do
      visit '/'
      expect(page).to have_content("Viewing Party!")
    end

    it "Has a button to create a new user" do
      visit '/'
      
      expect(page).to have_button("Create a New User")
      click_button("Create a New User")
      
      expect(current_path).to eq('/register')
    end

    xit "Has a list of existing users as links to their dashboards" do
      visit '/'
      
      within "#existing_users" do
        expect(page).to have_content("Existing Users")
        expect(page).to have_link(@user1.email)
        expect(page).to have_link(@user2.email)
        expect(page).to have_link(@user3.email)
        
        click_link(@user1.email)
      end
      expect(current_path).to eq(dashboard_path(@user1))
      expect(page).to have_content("#{@user1.name}'s Dashboard")
      expect(page).to_not have_content("#{@user2.name}'s Dashboard")
      
      visit '/'
      
      within "#existing_users" do
        click_link(@user2.email)
      end
      expect(current_path).to eq(dashboard_path(@user2))
      expect(page).to have_content("#{@user2.name}'s Dashboard")
      expect(page).to_not have_content("#{@user1.name}'s Dashboard")
    end

    it "Has a link on every page that leads back to Landing Page" do
      visit '/'
      expect(page).to have_link('Home')
      click_link('Home')
      expect(current_path).to eq('/')

      visit(dashboard_path(@user1))
      expect(page).to have_link('Home')
      click_link('Home')
      expect(current_path).to eq('/')

      visit '/register'
      expect(page).to have_link('Home')
      click_link('Home')
      expect(current_path).to eq('/')
    end
  end

  describe "Task 3: When I visit the Landing Page '/'" do
    it "no longer see list of existing users" do
      visit '/'
      expect(page).to_not have_content('Existing Users')
      save_and_open_page
    end
  end

end