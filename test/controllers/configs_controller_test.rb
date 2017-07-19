require 'test_helper'

class ConfigsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @config = configs(:one)
  end

  test "should get index" do
    get configs_url
    assert_response :success
  end

  test "should get new" do
    get new_config_url
    assert_response :success
  end

  test "should create config" do
    assert_difference('Config.count') do
      post configs_url, params: { config: { loc_resource1: @config.loc_resource1, loc_resource2: @config.loc_resource2, mgr_company: @config.mgr_company, mgr_email: @config.mgr_email, mgr_hr: @config.mgr_hr, mgr_it: @config.mgr_it, mgr_location: @config.mgr_location, mgr_refreshment: @config.mgr_refreshment, projector: @config.projector } }
    end

    assert_redirected_to config_url(Config.last)
  end

  test "should show config" do
    get config_url(@config)
    assert_response :success
  end

  test "should get edit" do
    get edit_config_url(@config)
    assert_response :success
  end

  test "should update config" do
    patch config_url(@config), params: { config: { loc_resource1: @config.loc_resource1, loc_resource2: @config.loc_resource2, mgr_company: @config.mgr_company, mgr_email: @config.mgr_email, mgr_hr: @config.mgr_hr, mgr_it: @config.mgr_it, mgr_location: @config.mgr_location, mgr_refreshment: @config.mgr_refreshment, projector: @config.projector } }
    assert_redirected_to config_url(@config)
  end

  test "should destroy config" do
    assert_difference('Config.count', -1) do
      delete config_url(@config)
    end

    assert_redirected_to configs_url
  end
end
