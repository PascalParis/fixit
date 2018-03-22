require 'test_helper'

class WorkordersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get workorders_index_url
    assert_response :success
  end

  test "should get show" do
    get workorders_show_url
    assert_response :success
  end

  test "should get new" do
    get workorders_new_url
    assert_response :success
  end

  test "should get create" do
    get workorders_create_url
    assert_response :success
  end

  test "should get delete" do
    get workorders_delete_url
    assert_response :success
  end

end
