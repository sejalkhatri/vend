require 'test_helper'

class VendorControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get vendor_login_url
    assert_response :success
  end

  test "should get signup" do
    get vendor_signup_url
    assert_response :success
  end

  test "should get add_product" do
    get vendor_add_product_url
    assert_response :success
  end

  test "should get create" do
    get vendor_create_url
    assert_response :success
  end

end
