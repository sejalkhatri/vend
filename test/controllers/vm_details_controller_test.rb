require 'test_helper'

class VmDetailsControllerTest < ActionDispatch::IntegrationTest
  test "should get add_quantity" do
    get vm_details_add_quantity_url
    assert_response :success
  end

  test "should get list_products" do
    get vm_details_list_products_url
    assert_response :success
  end

  test "should get subtract_quantity" do
    get vm_details_subtract_quantity_url
    assert_response :success
  end

end
