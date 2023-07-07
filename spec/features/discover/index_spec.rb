require 'rails_helper'

RSpec.describe "Discover Movies Page", type: :feature do
  before(:each) do
    @user1 = User.create!(name: 'Jim Bob', email: 'Jbob@somewhere.com')
    @user2 = User.create!(name: 'Tim Timson', email: 'Ttimmer@hotmail.com')
    @user3 = User.create!(name: 'Google Guy', email: 'Google@gmail.com')
  end

  it "Has a button to discover top rated movies" do
    visit discover_path(@user1)
    within '#discover_movies' do
      expect(page).to have_button('Find Top Rated Movies')
      click_button('Find Top Rated Movies')
    end
    expect(current_path).to eq(user_movies_path(@user1))
  end
  ## revisit once Movie Results Page is complete. Then search for a movie
  xit "Has a field to search for movie by title" do
    visit discover_path(@user1)
    within '#movie_search' do
      expect(page).to have_field(:search)
      expect(page).to have_button("Search")
    end
  end
end