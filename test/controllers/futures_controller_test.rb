require 'test_helper'

class FuturesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get futures_index_url
    assert_response :success
  end

  test "should get show" do
    get futures_show_url
    assert_response :success
  end

  test "should get new" do
    get futures_new_url
    assert_response :success
  end

  test "should get edit" do
    get futures_edit_url
    assert_response :success
  end

end
