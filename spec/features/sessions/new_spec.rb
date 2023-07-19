require "rails_helper"

RSpec.describe "Logging In" do
  it "can log in with valid credentials" do
    user = User.create!(
      email: "dirtydan@turing.edu",
      name: "Dirty Dan",
      password: "apples",
      password_confirmation: "apples"
    )    
    
    visit root_path

    expect(page).to have_button("Log In")

    click_button "Log In"

    expect(current_path).to eq(login_path)

    fill_in :email, with: user.email
    fill_in :password, with: user.password

    click_on "Log In"

    expect(current_path).to eq(root_path)

    expect(page).to have_content("Welcome, #{user.name}")
  end

  it "cannot log in with invalid credentials" do
    user = User.create!(
      email: "dirtydan@turing.edu",
      name: "Dirty Dan",
      password: "apples",
      password_confirmation: "apples"
    )    
  
    visit root_path

    click_on "Log In"

    expect(current_path).to eq(login_path)

    fill_in :email, with: user.email
    fill_in :password, with: "oranges"

    click_on "Log In"

    expect(current_path).to eq(login_path)

    expect(page).to have_content("Sorry, your credentials are bad. Please try again.")
  end

  it "when logged in, I see a button to 'Log Out'" do
    user = User.create!(
      email: "dirtydan@turing.edu",
      name: "Dirty Dan",
      password: "apples",
      password_confirmation: "apples"
    )    
  
    visit root_path

    click_on "Log In"

    expect(current_path).to eq(login_path)

    fill_in :email, with: user.email
    fill_in :password, with: user.password

    click_on "Log In"

    expect(current_path).to eq(root_path)

    expect(page).to have_button("Log Out")
  end

  it "I click button 'Log Out' and am redirected to welcome page, where I do not see button anymore" do
    user = User.create!(
      email: "dirtydan@turing.edu",
      name: "Dirty Dan",
      password: "apples",
      password_confirmation: "apples"
    )    
  
    visit root_path

    expect(page).to have_button("Log In")


    click_button "Log In"
    expect(current_path).to eq(login_path)

    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button "Log In"

    click_button "Log Out"
    expect(current_path).to eq(root_path)
    expect(page).to_not have_button("Log Out")
    expect(page).to have_button("Log In")
  end
end