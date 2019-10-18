require 'test_helper'

class LawyersRequestControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get lawyers_request_index_url
    assert_response :success
  end

end
