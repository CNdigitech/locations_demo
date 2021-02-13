require 'test_helper'

class ElectionEventLocationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @election_event_location = election_event_locations(:one)
  end

  test "should get index" do
    get election_event_locations_url
    assert_response :success
  end

  test "should get new" do
    get new_election_event_location_url
    assert_response :success
  end

  test "should create election_event_location" do
    assert_difference('ElectionEventLocation.count') do
      post election_event_locations_url, params: { election_event_location: { assigned_code: @election_event_location.assigned_code, constituency_id: @election_event_location.constituency_id, election_event_id: @election_event_location.election_event_id, region_id: @election_event_location.region_id } }
    end

    assert_redirected_to election_event_location_url(ElectionEventLocation.last)
  end

  test "should show election_event_location" do
    get election_event_location_url(@election_event_location)
    assert_response :success
  end

  test "should get edit" do
    get edit_election_event_location_url(@election_event_location)
    assert_response :success
  end

  test "should update election_event_location" do
    patch election_event_location_url(@election_event_location), params: { election_event_location: { assigned_code: @election_event_location.assigned_code, constituency_id: @election_event_location.constituency_id, election_event_id: @election_event_location.election_event_id, region_id: @election_event_location.region_id } }
    assert_redirected_to election_event_location_url(@election_event_location)
  end

  test "should destroy election_event_location" do
    assert_difference('ElectionEventLocation.count', -1) do
      delete election_event_location_url(@election_event_location)
    end

    assert_redirected_to election_event_locations_url
  end
end
