class Notification < ActiveRecord::Base

  belongs_to :user
  belongs_to :sender, class_name: "User"
  
  #validation
  validates_presence_of :title, :user_id, :message
end
