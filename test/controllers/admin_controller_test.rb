require 'test_helper'

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_index_url
    assert_response :success
  end

  test "should get list" do
    get admin_list_url
    assert_response :success
  end

  test "should get setting" do
    get admin_setting_url
    assert_response :success
  end

end
