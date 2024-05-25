require "test_helper"

class TenantAdmin::DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tenant_admin_dashboard_index_url
    assert_response :success
  end
end
