require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  DEFAULT_USER_ID = 1

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should get show" do
    get user_path DEFAULT_USER_ID
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url DEFAULT_USER_ID
    assert_response :success
  end

  test "should get update" do
    get edit_user_url DEFAULT_USER_ID
    assert_response :success
  end

end
