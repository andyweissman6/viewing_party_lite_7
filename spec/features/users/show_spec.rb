require 'rails_helper'

RSpec.describe "User Dashboard Page '/users/:id'", type: :feature do
  before(:each) do
    @user1 = User.create!(name: 'Jim Bob', email: 'Jbob@somewhere.com')
    @user2 = User.create!(name: 'Tim Timson', email: 'Ttimmer@hotmail.com')
    @user3 = User.create!(name: 'Google Guy', email: 'Google@gmail.com')
  end
end