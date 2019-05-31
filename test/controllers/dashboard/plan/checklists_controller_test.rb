require 'test_helper'

class Dashboard::Plan::ChecklistsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get dashboard_plan_checklists_create_url
    assert_response :success
  end

  test "should get destroy" do
    get dashboard_plan_checklists_destroy_url
    assert_response :success
  end

end
