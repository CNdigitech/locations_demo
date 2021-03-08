require 'test_helper'

class PollingStationMastersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @polling_station_master = polling_station_masters(:one)
  end

  test "should get index" do
    get polling_station_masters_url
    assert_response :success
  end

  test "should get new" do
    get new_polling_station_master_url
    assert_response :success
  end

  test "should create polling_station_master" do
    assert_difference('PollingStationMaster.count') do
      post polling_station_masters_url, params: { polling_station_master: { active_status: @polling_station_master.active_status, constituency_collation_center: @polling_station_master.constituency_collation_center, constituency_id: @polling_station_master.constituency_id, del_status_boolean: @polling_station_master.del_status_boolean, ec_polling_station_code: @polling_station_master.ec_polling_station_code, name: @polling_station_master.name, polling_station_gps: @polling_station_master.polling_station_gps, polling_station_id: @polling_station_master.polling_station_id, region_id: @polling_station_master.region_id, registered_voters: @polling_station_master.registered_voters, user_id: @polling_station_master.user_id } }
    end

    assert_redirected_to polling_station_master_url(PollingStationMaster.last)
  end

  test "should show polling_station_master" do
    get polling_station_master_url(@polling_station_master)
    assert_response :success
  end

  test "should get edit" do
    get edit_polling_station_master_url(@polling_station_master)
    assert_response :success
  end

  test "should update polling_station_master" do
    patch polling_station_master_url(@polling_station_master), params: { polling_station_master: { active_status: @polling_station_master.active_status, constituency_collation_center: @polling_station_master.constituency_collation_center, constituency_id: @polling_station_master.constituency_id, del_status_boolean: @polling_station_master.del_status_boolean, ec_polling_station_code: @polling_station_master.ec_polling_station_code, name: @polling_station_master.name, polling_station_gps: @polling_station_master.polling_station_gps, polling_station_id: @polling_station_master.polling_station_id, region_id: @polling_station_master.region_id, registered_voters: @polling_station_master.registered_voters, user_id: @polling_station_master.user_id } }
    assert_redirected_to polling_station_master_url(@polling_station_master)
  end

  test "should destroy polling_station_master" do
    assert_difference('PollingStationMaster.count', -1) do
      delete polling_station_master_url(@polling_station_master)
    end

    assert_redirected_to polling_station_masters_url
  end
end
