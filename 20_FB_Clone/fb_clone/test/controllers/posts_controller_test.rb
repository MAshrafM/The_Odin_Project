require "test_helper"

class PostsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_response :success
  end

end
