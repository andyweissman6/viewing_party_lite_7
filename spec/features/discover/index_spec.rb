require 'rails_helper'

RSpec.describe "Discover Movies Page", type: :feature do
  before(:each) do
    @user1 = User.create!(name: 'Jim Bob', email: 'Jbob@somewhere.com')
    @user2 = User.create!(name: 'Tim Timson', email: 'Ttimmer@hotmail.com')
    @user3 = User.create!(name: 'Google Guy', email: 'Google@gmail.com')
  end

  it "Has a button to discover top rated movies" do
    visit discover_path(@user1)
    expect(page).to have_button('Find Top Rated Movies')
  end
  
  it "Search field to search by movie title" do
    visit discover_path(@user1)
    expect(page).to have_field(:search)
  end
end