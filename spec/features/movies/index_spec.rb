require 'rails_helper'

RSpec.describe "Movie Index", type: :feature do
  before(:each) do
    @user1 = User.create!(name: "Jim Bob", email: "Jbob@somewhere.com")
    @user2 = User.create!(name: "Tim Timson", email: "Ttimmer@hotmail.com")
    @user3 = User.create!(name: "Google Guy", email: "Google@gmail.com")
  end

  describe "When I visit the user_movies_path(user)" do
    it "should display list of movies for specific user" do
      visit user_movies_path(@user1)
      
    end
  end
end