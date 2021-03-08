require 'test_helper'

class DistrictTypeMastersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @district_type_master = district_type_masters(:one)
  end

  test "should get index" do
    get district_type_masters_url
    assert_response :success
  end

  test "should get new" do
    get new_district_type_master_url
    assert_response :success
  end

  test "should create district_type_master" do
    assert_difference('DistrictTypeMaster.count') do
      post district_type_masters_url, params: { district_type_master: { assigned_code: @district_type_master.assigned_code, name: @district_type_master.name } }
    end

    assert_redirected_to district_type_master_url(DistrictTypeMaster.last)
  end

  test "should show district_type_master" do
    get district_type_master_url(@district_type_master)
    assert_response :success
  end

  test "should get edit" do
    get edit_district_type_master_url(@district_type_master)
    assert_response :success
  end

  test "should update district_type_master" do
    patch district_type_master_url(@district_type_master), params: { district_type_master: { assigned_code: @district_type_master.assigned_code, name: @district_type_master.name } }
    assert_redirected_to district_type_master_url(@district_type_master)
  end

  test "should destroy district_type_master" do
    assert_difference('DistrictTypeMaster.count', -1) do
      delete district_type_master_url(@district_type_master)
    end

    assert_redirected_to district_type_masters_url
  end
end
