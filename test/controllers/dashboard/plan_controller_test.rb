require 'test_helper'

class Dashboard::PlanControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dashboard_plan_index_url
    assert_response :success
  end

end
