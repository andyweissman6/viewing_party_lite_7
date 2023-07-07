require 'rails_helper'

RSpec.describe "User Dashboard Page '/users/:id'", type: :feature do
  before(:each) do
    @user1 = User.create!(name: 'Jim Bob', email: 'Jbob@somewhere.com')
    @user2 = User.create!(name: 'Tim Timson', email: 'Ttimmer@hotmail.com')
    @user3 = User.create!(name: 'Google Guy', email: 'Google@gmail.com')
  end

  describe "When I visit a user's dashboard" do
    it "Displays the user's name at the top of the page" do
      visit dashboard_path(@user1)
      expect(page).to have_content("#{@user1.name}'s Dashboard")
      
      visit dashboard_path(@user2)
      expect(page).to have_content("#{@user2.name}'s Dashboard")
    end
    
    it "Has a button to discover movies" do
      visit dashboard_path(@user1)

      within '#discover' do
        expect(page).to have_button("Discover Movies")
        click_button("Discover Movies")
      end
      expect(current_path).to eq(discover_path(@user1))
    end
    ## revisit once Movie Results Page is complete.
    xit "Has a section that displays parties a user has been invited to" do
      within '#invited' do
        
      end
    end
    
    ## revisit once Movie Results Page is complete.
    xit "Has a section that displays a user's hosted parties" do
      within 'hosted' do

      end
    end
  end
end