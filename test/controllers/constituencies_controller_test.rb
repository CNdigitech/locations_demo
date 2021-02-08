require 'test_helper'

class ConstituenciesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @constituency = constituencies(:one)
  end

  test "should get index" do
    get constituencies_url
    assert_response :success
  end

  test "should get new" do
    get new_constituency_url
    assert_response :success
  end

  test "should create constituency" do
    assert_difference('Constituency.count') do
      post constituencies_url, params: { constituency: { constituency_id: @constituency.constituency_id, district_id: @constituency.district_id, ec_constituency_code: @constituency.ec_constituency_code, name: @constituency.name, registered_voters: @constituency.registered_voters } }
    end

    assert_redirected_to constituency_url(Constituency.last)
  end

  test "should show constituency" do
    get constituency_url(@constituency)
    assert_response :success
  end

  test "should get edit" do
    get edit_constituency_url(@constituency)
    assert_response :success
  end

  test "should update constituency" do
    patch constituency_url(@constituency), params: { constituency: { constituency_id: @constituency.constituency_id, district_id: @constituency.district_id, ec_constituency_code: @constituency.ec_constituency_code, name: @constituency.name, registered_voters: @constituency.registered_voters } }
    assert_redirected_to constituency_url(@constituency)
  end

  test "should destroy constituency" do
    assert_difference('Constituency.count', -1) do
      delete constituency_url(@constituency)
    end

    assert_redirected_to constituencies_url
  end
end
