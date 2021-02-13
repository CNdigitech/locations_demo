require "application_system_test_case"

class PollingStationMastersTest < ApplicationSystemTestCase
  setup do
    @polling_station_master = polling_station_masters(:one)
  end

  test "visiting the index" do
    visit polling_station_masters_url
    assert_selector "h1", text: "Polling Station Masters"
  end

  test "creating a Polling station master" do
    visit polling_station_masters_url
    click_on "New Polling Station Master"

    check "Active status" if @polling_station_master.active_status
    check "Constituency collation center" if @polling_station_master.constituency_collation_center
    fill_in "Constituency", with: @polling_station_master.constituency_id
    fill_in "Del status boolean", with: @polling_station_master.del_status_boolean
    fill_in "Ec polling station code", with: @polling_station_master.ec_polling_station_code
    fill_in "Name", with: @polling_station_master.name
    fill_in "Polling station gps", with: @polling_station_master.polling_station_gps
    fill_in "Polling station", with: @polling_station_master.polling_station_id
    fill_in "Region", with: @polling_station_master.region_id
    fill_in "Registered voters", with: @polling_station_master.registered_voters
    fill_in "User", with: @polling_station_master.user_id
    click_on "Create Polling station master"

    assert_text "Polling station master was successfully created"
    click_on "Back"
  end

  test "updating a Polling station master" do
    visit polling_station_masters_url
    click_on "Edit", match: :first

    check "Active status" if @polling_station_master.active_status
    check "Constituency collation center" if @polling_station_master.constituency_collation_center
    fill_in "Constituency", with: @polling_station_master.constituency_id
    fill_in "Del status boolean", with: @polling_station_master.del_status_boolean
    fill_in "Ec polling station code", with: @polling_station_master.ec_polling_station_code
    fill_in "Name", with: @polling_station_master.name
    fill_in "Polling station gps", with: @polling_station_master.polling_station_gps
    fill_in "Polling station", with: @polling_station_master.polling_station_id
    fill_in "Region", with: @polling_station_master.region_id
    fill_in "Registered voters", with: @polling_station_master.registered_voters
    fill_in "User", with: @polling_station_master.user_id
    click_on "Update Polling station master"

    assert_text "Polling station master was successfully updated"
    click_on "Back"
  end

  test "destroying a Polling station master" do
    visit polling_station_masters_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Polling station master was successfully destroyed"
  end
end
