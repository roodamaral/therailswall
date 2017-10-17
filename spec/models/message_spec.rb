require 'rails_helper'

RSpec.describe Message, type: :model do
  it "should not save if message is blank" do
  	message = Message.new(
  		message: 'oioioi',
  		user_id: 1  
  		)
  	expect(message).to be_invalid
  end
  it "should not save if user field is blank" do 
  	message = Message.new(
  		message:"oiooioioioioioioioioioioioi",)
  	expect(message).to be_invalid
  end

end
