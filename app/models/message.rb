class Message < ActiveRecord::Base
  belongs_to :user
  validates :message, length: { minimum: 10 }
  validates :user_id, presence: true 
end
