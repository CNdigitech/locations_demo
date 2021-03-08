require "application_system_test_case"

class ElectionEventMastersTest < ApplicationSystemTestCase
  setup do
    @election_event_master = election_event_masters(:one)
  end

  test "visiting the index" do
    visit election_event_masters_url
    assert_selector "h1", text: "Election Event Masters"
  end

  test "creating a Election event master" do
    visit election_event_masters_url
    click_on "New Election Event Master"

    check "Active status" if @election_event_master.active_status
    check "Del status" if @election_event_master.del_status
    fill_in "Ec election reference", with: @election_event_master.ec_election_reference
    fill_in "Election date", with: @election_event_master.election_date
    fill_in "Election event", with: @election_event_master.election_event_id
    fill_in "Election type", with: @election_event_master.election_type
    fill_in "Event name", with: @election_event_master.event_name
    fill_in "Notes", with: @election_event_master.notes
    fill_in "User", with: @election_event_master.user_id
    click_on "Create Election event master"

    assert_text "Election event master was successfully created"
    click_on "Back"
  end

  test "updating a Election event master" do
    visit election_event_masters_url
    click_on "Edit", match: :first

    check "Active status" if @election_event_master.active_status
    check "Del status" if @election_event_master.del_status
    fill_in "Ec election reference", with: @election_event_master.ec_election_reference
    fill_in "Election date", with: @election_event_master.election_date
    fill_in "Election event", with: @election_event_master.election_event_id
    fill_in "Election type", with: @election_event_master.election_type
    fill_in "Event name", with: @election_event_master.event_name
    fill_in "Notes", with: @election_event_master.notes
    fill_in "User", with: @election_event_master.user_id
    click_on "Update Election event master"

    assert_text "Election event master was successfully updated"
    click_on "Back"
  end

  test "destroying a Election event master" do
    visit election_event_masters_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Election event master was successfully destroyed"
  end
end
