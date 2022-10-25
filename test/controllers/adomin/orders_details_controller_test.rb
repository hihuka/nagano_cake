require "test_helper"

class Adomin::OrdersDetailsControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get adomin_orders_details_update_url
    assert_response :success
  end
end
