require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Comment Model" do
    context "Validations" do
      it "validate presence of body" do
        should validate_presence_of :body
      end
      
      it "validate presence of user" do
        should validate_presence_of :user_id
      end
      
      it "validate presence of post" do
        should validate_presence_of :post_id
      end
    end
    
    context "Association" do
      it "belong to a user" do
        should belong_to :user
      end
      
      it "belong to a post" do
        should belong_to :post
      end
    end
  end
end