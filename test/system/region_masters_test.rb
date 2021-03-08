require "application_system_test_case"

class RegionMastersTest < ApplicationSystemTestCase
  setup do
    @region_master = region_masters(:one)
  end

  test "visiting the index" do
    visit region_masters_url
    assert_selector "h1", text: "Region Masters"
  end

  test "creating a Region master" do
    visit region_masters_url
    click_on "New Region Master"

    fill_in "Capital", with: @region_master.capital
    fill_in "Capital gps", with: @region_master.capital_gps
    fill_in "Name", with: @region_master.name
    fill_in "Region code", with: @region_master.region_code
    fill_in "Region", with: @region_master.region_id
    click_on "Create Region master"

    assert_text "Region master was successfully created"
    click_on "Back"
  end

  test "updating a Region master" do
    visit region_masters_url
    click_on "Edit", match: :first

    fill_in "Capital", with: @region_master.capital
    fill_in "Capital gps", with: @region_master.capital_gps
    fill_in "Name", with: @region_master.name
    fill_in "Region code", with: @region_master.region_code
    fill_in "Region", with: @region_master.region_id
    click_on "Update Region master"

    assert_text "Region master was successfully updated"
    click_on "Back"
  end

  test "destroying a Region master" do
    visit region_masters_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Region master was successfully destroyed"
  end
end
