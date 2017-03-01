require "test_helper"

class NotificationsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_response :success
  end

  def test_destroy
    get :destroy
    assert_response :success
  end

end
