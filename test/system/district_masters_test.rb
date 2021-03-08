require "application_system_test_case"

class DistrictMastersTest < ApplicationSystemTestCase
  setup do
    @district_master = district_masters(:one)
  end

  test "visiting the index" do
    visit district_masters_url
    assert_selector "h1", text: "District Masters"
  end

  test "creating a District master" do
    visit district_masters_url
    click_on "New District Master"

    fill_in "Capital", with: @district_master.capital
    fill_in "Capital gps", with: @district_master.capital_gps
    fill_in "District", with: @district_master.district_id
    fill_in "District type", with: @district_master.district_type
    fill_in "Name", with: @district_master.name
    fill_in "Region", with: @district_master.region_id
    click_on "Create District master"

    assert_text "District master was successfully created"
    click_on "Back"
  end

  test "updating a District master" do
    visit district_masters_url
    click_on "Edit", match: :first

    fill_in "Capital", with: @district_master.capital
    fill_in "Capital gps", with: @district_master.capital_gps
    fill_in "District", with: @district_master.district_id
    fill_in "District type", with: @district_master.district_type
    fill_in "Name", with: @district_master.name
    fill_in "Region", with: @district_master.region_id
    click_on "Update District master"

    assert_text "District master was successfully updated"
    click_on "Back"
  end

  test "destroying a District master" do
    visit district_masters_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "District master was successfully destroyed"
  end
end
