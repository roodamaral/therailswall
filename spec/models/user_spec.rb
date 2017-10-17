require 'rails_helper'

RSpec.describe User, type: :model do
  it "should not save if username is blank" do
  	user = User.new(
  		username: '')
  	expect(user).to be_invalid
  end
  
end
