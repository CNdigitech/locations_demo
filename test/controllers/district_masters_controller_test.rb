require 'test_helper'

class DistrictMastersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @district_master = district_masters(:one)
  end

  test "should get index" do
    get district_masters_url
    assert_response :success
  end

  test "should get new" do
    get new_district_master_url
    assert_response :success
  end

  test "should create district_master" do
    assert_difference('DistrictMaster.count') do
      post district_masters_url, params: { district_master: { capital: @district_master.capital, capital_gps: @district_master.capital_gps, district_id: @district_master.district_id, district_type: @district_master.district_type, name: @district_master.name, region_id: @district_master.region_id } }
    end

    assert_redirected_to district_master_url(DistrictMaster.last)
  end

  test "should show district_master" do
    get district_master_url(@district_master)
    assert_response :success
  end

  test "should get edit" do
    get edit_district_master_url(@district_master)
    assert_response :success
  end

  test "should update district_master" do
    patch district_master_url(@district_master), params: { district_master: { capital: @district_master.capital, capital_gps: @district_master.capital_gps, district_id: @district_master.district_id, district_type: @district_master.district_type, name: @district_master.name, region_id: @district_master.region_id } }
    assert_redirected_to district_master_url(@district_master)
  end

  test "should destroy district_master" do
    assert_difference('DistrictMaster.count', -1) do
      delete district_master_url(@district_master)
    end

    assert_redirected_to district_masters_url
  end
end
