require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get terms_conditions" do
    get pages_terms_conditions_url
    assert_response :success
  end

end
