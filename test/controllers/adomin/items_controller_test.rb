require "test_helper"

class Adomin::ItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get adomin_items_index_url
    assert_response :success
  end

  test "should get new" do
    get adomin_items_new_url
    assert_response :success
  end

  test "should get create" do
    get adomin_items_create_url
    assert_response :success
  end

  test "should get show" do
    get adomin_items_show_url
    assert_response :success
  end

  test "should get edit" do
    get adomin_items_edit_url
    assert_response :success
  end

  test "should get update" do
    get adomin_items_update_url
    assert_response :success
  end
end
