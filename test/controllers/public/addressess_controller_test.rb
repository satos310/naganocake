require "test_helper"

class Public::AddressessControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_addressess_index_url
    assert_response :success
  end

  test "should get edit" do
    get public_addressess_edit_url
    assert_response :success
  end

  test "should get create" do
    get public_addressess_create_url
    assert_response :success
  end

  test "should get update" do
    get public_addressess_update_url
    assert_response :success
  end

  test "should get destroy" do
    get public_addressess_destroy_url
    assert_response :success
  end
end
