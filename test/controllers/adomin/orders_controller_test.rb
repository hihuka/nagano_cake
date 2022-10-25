require "test_helper"

class Adomin::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get adomin_orders_index_url
    assert_response :success
  end

  test "should get show" do
    get adomin_orders_show_url
    assert_response :success
  end

  test "should get update" do
    get adomin_orders_update_url
    assert_response :success
  end
end
