require 'test_helper'

class Dashboard::Plan::EventControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dashboard_plan_event_index_url
    assert_response :success
  end

  test "should get create" do
    get dashboard_plan_event_create_url
    assert_response :success
  end

  test "should get new" do
    get dashboard_plan_event_new_url
    assert_response :success
  end

  test "should get destroy" do
    get dashboard_plan_event_destroy_url
    assert_response :success
  end

  test "should get show" do
    get dashboard_plan_event_show_url
    assert_response :success
  end

  test "should get edit" do
    get dashboard_plan_event_edit_url
    assert_response :success
  end

  test "should get update" do
    get dashboard_plan_event_update_url
    assert_response :success
  end

end
