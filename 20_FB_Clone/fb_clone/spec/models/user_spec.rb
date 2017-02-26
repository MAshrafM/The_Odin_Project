require 'rails_helper'

RSpec.describe User, type: :model do
  
  context "Validations" do
    it "should validates presence of a name" do
      should validate_presence_of :name
    end
    
    it "should validates presence of a last_name" do
      should validate_presence_of :last_name
    end
  end
end
