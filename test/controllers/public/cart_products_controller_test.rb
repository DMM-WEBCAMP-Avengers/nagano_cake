require 'test_helper'

class Public::CartProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_cart_products_index_url
    assert_response :success
  end

end
