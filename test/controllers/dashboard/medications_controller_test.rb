require 'test_helper'

class Dashboard::MedicationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dashboard_organize_medications_index_url
    assert_response :success
  end

  test "should get new" do
    get dashboard_organize_medications_new_url
    assert_response :success
  end

  test "should get create" do
    get dashboard_organize_medications_create_url
    assert_response :success
  end

  test "should get edit" do
    get dashboard_organize_medications_edit_url
    assert_response :success
  end

  test "should get update" do
    get dashboard_organize_medications_update_url
    assert_response :success
  end

  test "should get destroy" do
    get dashboard_organize_medications_destroy_url
    assert_response :success
  end

end
