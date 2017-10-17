require 'rails_helper'
feature "guest user creates an account" do
  before(:each) do 
    visit new_user_path
  end
  scenario "successfully creates a new user account" do
    fill_in "user[username]", with: "roodamaral"
    click_button "Create User"
    expect(page).to have_content "Welcome, roodamaral"
    expect(page).to have_current_path(user_messages_path(User.last)) 
  end
  scenario "unsuccessfully creates a new user account" do 
  	click_button "Create User"
    expect(current_path).to eq(new_user_path)
  end
  scenario "doesn't fill out username field" do 
    fill_in "user[username]", with: ""
    click_button "Create User"
    expect(page).to have_content "Username can't be blank"
  end
end