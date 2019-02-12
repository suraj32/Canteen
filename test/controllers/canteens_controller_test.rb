require 'test_helper'

class CanteensControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get canteens_index_url
    assert_response :success
  end

  test "should get show" do
    get canteens_show_url
    assert_response :success
  end

  test "should get create" do
    get canteens_create_url
    assert_response :success
  end

end
