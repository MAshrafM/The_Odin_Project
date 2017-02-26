require 'rails_helper'

RSpec.describe Post, type: :model do
  
  context "Validations" do
    it "should validate presence of a body" do
      should validate_presence_of :body
    end
    
    it "should validate length of body" do
      should validate_length_of(:body).is_at_most(1000)
    end
  end
end
