require 'test_helper'

class RegionMastersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @region_master = region_masters(:one)
  end

  test "should get index" do
    get region_masters_url
    assert_response :success
  end

  test "should get new" do
    get new_region_master_url
    assert_response :success
  end

  test "should create region_master" do
    assert_difference('RegionMaster.count') do
      post region_masters_url, params: { region_master: { capital: @region_master.capital, capital_gps: @region_master.capital_gps, name: @region_master.name, region_code: @region_master.region_code, region_id: @region_master.region_id } }
    end

    assert_redirected_to region_master_url(RegionMaster.last)
  end

  test "should show region_master" do
    get region_master_url(@region_master)
    assert_response :success
  end

  test "should get edit" do
    get edit_region_master_url(@region_master)
    assert_response :success
  end

  test "should update region_master" do
    patch region_master_url(@region_master), params: { region_master: { capital: @region_master.capital, capital_gps: @region_master.capital_gps, name: @region_master.name, region_code: @region_master.region_code, region_id: @region_master.region_id } }
    assert_redirected_to region_master_url(@region_master)
  end

  test "should destroy region_master" do
    assert_difference('RegionMaster.count', -1) do
      delete region_master_url(@region_master)
    end

    assert_redirected_to region_masters_url
  end
end
