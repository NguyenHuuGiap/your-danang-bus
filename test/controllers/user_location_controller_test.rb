require 'test_helper'

class UserLocationControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get user_location_create_url
    assert_response :success
  end

end
