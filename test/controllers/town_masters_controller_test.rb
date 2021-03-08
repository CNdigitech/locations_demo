require 'test_helper'

class TownMastersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @town_master = town_masters(:one)
  end

  test "should get index" do
    get town_masters_url
    assert_response :success
  end

  test "should get new" do
    get new_town_master_url
    assert_response :success
  end

  test "should create town_master" do
    assert_difference('TownMaster.count') do
      post town_masters_url, params: { town_master: { district_id: @town_master.district_id, name: @town_master.name, town_center_gps: @town_master.town_center_gps, town_id: @town_master.town_id } }
    end

    assert_redirected_to town_master_url(TownMaster.last)
  end

  test "should show town_master" do
    get town_master_url(@town_master)
    assert_response :success
  end

  test "should get edit" do
    get edit_town_master_url(@town_master)
    assert_response :success
  end

  test "should update town_master" do
    patch town_master_url(@town_master), params: { town_master: { district_id: @town_master.district_id, name: @town_master.name, town_center_gps: @town_master.town_center_gps, town_id: @town_master.town_id } }
    assert_redirected_to town_master_url(@town_master)
  end

  test "should destroy town_master" do
    assert_difference('TownMaster.count', -1) do
      delete town_master_url(@town_master)
    end

    assert_redirected_to town_masters_url
  end
end
