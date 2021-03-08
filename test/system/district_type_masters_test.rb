require "application_system_test_case"

class DistrictTypeMastersTest < ApplicationSystemTestCase
  setup do
    @district_type_master = district_type_masters(:one)
  end

  test "visiting the index" do
    visit district_type_masters_url
    assert_selector "h1", text: "District Type Masters"
  end

  test "creating a District type master" do
    visit district_type_masters_url
    click_on "New District Type Master"

    fill_in "Assigned code", with: @district_type_master.assigned_code
    fill_in "Name", with: @district_type_master.name
    click_on "Create District type master"

    assert_text "District type master was successfully created"
    click_on "Back"
  end

  test "updating a District type master" do
    visit district_type_masters_url
    click_on "Edit", match: :first

    fill_in "Assigned code", with: @district_type_master.assigned_code
    fill_in "Name", with: @district_type_master.name
    click_on "Update District type master"

    assert_text "District type master was successfully updated"
    click_on "Back"
  end

  test "destroying a District type master" do
    visit district_type_masters_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "District type master was successfully destroyed"
  end
end
