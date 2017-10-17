require 'rails_helper'
feature "guest user can logout" do
   scenario "successfully logsout" do
    visit new_user_path
    fill_in "user[username]", with: "roodamaral"
    click_button "Create User"
    click_link "logout"
    expect(page).to have_current_path(new_user_path)
  end
end