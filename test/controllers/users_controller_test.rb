require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get users_top_url
    assert_response :success
  end

  test "should get edit" do
    get users_edit_url
    assert_response :success
  end

  test "should get show" do
    get users_show_url
    assert_response :success
  end

  test "should get cancel" do
    get users_cancel_url
    assert_response :success
  end

end
