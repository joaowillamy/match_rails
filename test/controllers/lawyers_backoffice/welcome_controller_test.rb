require 'test_helper'

class LawyersBackoffice::WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get lawyers_backoffice_welcome_index_url
    assert_response :success
  end

end
