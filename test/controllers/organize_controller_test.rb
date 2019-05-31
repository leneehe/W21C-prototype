require 'test_helper'

class OrganizeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get organize_index_url
    assert_response :success
  end

end
