require "test_helper"

class Adomin::CustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get adomin_customers_index_url
    assert_response :success
  end

  test "should get show" do
    get adomin_customers_show_url
    assert_response :success
  end

  test "should get edit" do
    get adomin_customers_edit_url
    assert_response :success
  end

  test "should get update" do
    get adomin_customers_update_url
    assert_response :success
  end
end
