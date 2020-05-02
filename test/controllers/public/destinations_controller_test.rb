require 'test_helper'

class Public::DestinationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_destinations_index_url
    assert_response :success
  end

  test "should get edit" do
    get public_destinations_edit_url
    assert_response :success
  end

end
