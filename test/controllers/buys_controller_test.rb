require "test_helper"

class BuysControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get buys_index_url
    assert_response :success
  end

  test "should get new" do
    get buys_new_url
    assert_response :success
  end

  test "should get create" do
    get buys_create_url
    assert_response :success
  end
end
