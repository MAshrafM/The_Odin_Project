require 'rails_helper'

RSpec.describe Friendship, type: :model do
  
  context "Validations" do
    it "should validates presence of a request from id" do
      should validate_presence_of :request_from_id
    end
    
    it "should validates presence of a request to id" do
      should validate_presence_of :request_to_id
    end
  end
  
  context "Association" do
    it "should belong to request from a person" do
      should belong_to :request_from
    end
    
    it "should belong to request to a person" do
      should belong_to :request_to
    end
  end
end
