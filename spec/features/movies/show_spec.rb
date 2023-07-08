require 'rails_helper'

RSpec.describe "Movie Show Page", type: :feature do
  before(:each) do
    @user1 = User.create!(name: 'Jim Bob', email: 'Jbob@somewhere.com')
    @user2 = User.create!(name: 'Tim Timson', email: 'Ttimmer@hotmail.com')
    @user3 = User.create!(name: 'Google Guy', email: 'Google@gmail.com')
  end

  describe "A Movie Show page" do
    it "Should have a button to create a viewing party" do
      visit user_movie_path(@user1.id, 10)
      expect(page).to have_button("Create Viewing Party")

      click_button("Create Viewing Party")
      expect(current_path).to eq(new_party_path(@user1.id, 10))
    end
  end
end