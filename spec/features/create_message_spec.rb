require 'rails_helper'
feature "guest user creates a message" do
  before(:each) do 
    visit new_user_path
    fill_in "user[username]", with: "roodamaral"
    click_button "Create User"
  end
  scenario "successfully creates a new message" do
    fill_in "message[message]", with: "Hello, my name is Rodrigo and I am a really cool guy."
    click_button "Submit"
    expect(page).to have_current_path(user_messages_path(1))
    visit user_messages_path(1)
    expect(page).to have_content "Hello, my name is Rodrigo and I am a really cool guy."
  end
  scenario "unsuccessfully creates a new message" do
    fill_in "message[message]", with: ""
    click_button "Submit"
    expect(page).to have_current_path(user_messages_path(1))
    expect(page).to have_content "Message is too short (minimum is 10 characters)"
  end
end