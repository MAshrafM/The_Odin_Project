require 'rails_helper'

RSpec.describe Post, type: :model do
  
  context "Validations" do
    it "should validate presence of a body" do
      should validate_presence_of :body
    end
    
    it "should validate presence of a user" do
      should validate_presence_of :user_id
    end
    
    it "should validate length of body" do
      should validate_length_of(:body).is_at_most(1000)
    end
  end
  
  context "Association" do
    it "should belong to a user" do
      should belong_to :user
    end
  end
end
