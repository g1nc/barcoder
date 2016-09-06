require 'test_helper'

class DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dashboard_index_url
    assert_response :success
  end

  test "should get contacts" do
    get dashboard_contacts_url
    assert_response :success
  end

  test "should get settings" do
    get dashboard_settings_url
    assert_response :success
  end

  test "should get notification" do
    get dashboard_notification_url
    assert_response :success
  end

end
