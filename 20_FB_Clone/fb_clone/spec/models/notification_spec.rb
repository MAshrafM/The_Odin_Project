require 'rails_helper'

RSpec.describe Notification, type: :model do
  context "Validations" do
    it "should validates presence of a title" do
      should validate_presence_of :title
    end
    
    it "should validates presence of a message" do
      should validate_presence_of :message
    end
    
    it "should validates presence of a user" do
      should validate_presence_of :user_id
    end
  end
  
  context "Association" do
    it "should belong to user" do
      should belong_to :user
    end
    
  end
end