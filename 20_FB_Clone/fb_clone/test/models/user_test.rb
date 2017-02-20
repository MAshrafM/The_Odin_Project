require 'test_helper'
  
class UserTest < ActiveSupport::TestCase
  def setup
    @valid_user = users(:valid_user)
    @invalid_user = users(:invalid_user)
  end
  
  test "User should be valid" do
  
  end
end