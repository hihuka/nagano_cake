require "test_helper"

class Adomin::GenresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get adomin_genres_index_url
    assert_response :success
  end

  test "should get create" do
    get adomin_genres_create_url
    assert_response :success
  end

  test "should get edit" do
    get adomin_genres_edit_url
    assert_response :success
  end

  test "should get update" do
    get adomin_genres_update_url
    assert_response :success
  end
end
