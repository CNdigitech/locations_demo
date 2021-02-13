require 'test_helper'

class ElectionEventMastersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @election_event_master = election_event_masters(:one)
  end

  test "should get index" do
    get election_event_masters_url
    assert_response :success
  end

  test "should get new" do
    get new_election_event_master_url
    assert_response :success
  end

  test "should create election_event_master" do
    assert_difference('ElectionEventMaster.count') do
      post election_event_masters_url, params: { election_event_master: { active_status: @election_event_master.active_status, del_status: @election_event_master.del_status, ec_election_reference: @election_event_master.ec_election_reference, election_date: @election_event_master.election_date, election_event_id: @election_event_master.election_event_id, election_type: @election_event_master.election_type, event_name: @election_event_master.event_name, notes: @election_event_master.notes, user_id: @election_event_master.user_id } }
    end

    assert_redirected_to election_event_master_url(ElectionEventMaster.last)
  end

  test "should show election_event_master" do
    get election_event_master_url(@election_event_master)
    assert_response :success
  end

  test "should get edit" do
    get edit_election_event_master_url(@election_event_master)
    assert_response :success
  end

  test "should update election_event_master" do
    patch election_event_master_url(@election_event_master), params: { election_event_master: { active_status: @election_event_master.active_status, del_status: @election_event_master.del_status, ec_election_reference: @election_event_master.ec_election_reference, election_date: @election_event_master.election_date, election_event_id: @election_event_master.election_event_id, election_type: @election_event_master.election_type, event_name: @election_event_master.event_name, notes: @election_event_master.notes, user_id: @election_event_master.user_id } }
    assert_redirected_to election_event_master_url(@election_event_master)
  end

  test "should destroy election_event_master" do
    assert_difference('ElectionEventMaster.count', -1) do
      delete election_event_master_url(@election_event_master)
    end

    assert_redirected_to election_event_masters_url
  end
end
