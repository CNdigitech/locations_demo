require "application_system_test_case"

class ElectionEventLocationsTest < ApplicationSystemTestCase
  setup do
    @election_event_location = election_event_locations(:one)
  end

  test "visiting the index" do
    visit election_event_locations_url
    assert_selector "h1", text: "Election Event Locations"
  end

  test "creating a Election event location" do
    visit election_event_locations_url
    click_on "New Election Event Location"

    fill_in "Assigned code", with: @election_event_location.assigned_code
    fill_in "Constituency", with: @election_event_location.constituency_id
    fill_in "Election event", with: @election_event_location.election_event_id
    fill_in "Region", with: @election_event_location.region_id
    click_on "Create Election event location"

    assert_text "Election event location was successfully created"
    click_on "Back"
  end

  test "updating a Election event location" do
    visit election_event_locations_url
    click_on "Edit", match: :first

    fill_in "Assigned code", with: @election_event_location.assigned_code
    fill_in "Constituency", with: @election_event_location.constituency_id
    fill_in "Election event", with: @election_event_location.election_event_id
    fill_in "Region", with: @election_event_location.region_id
    click_on "Update Election event location"

    assert_text "Election event location was successfully updated"
    click_on "Back"
  end

  test "destroying a Election event location" do
    visit election_event_locations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Election event location was successfully destroyed"
  end
end
