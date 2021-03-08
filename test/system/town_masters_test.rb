require "application_system_test_case"

class TownMastersTest < ApplicationSystemTestCase
  setup do
    @town_master = town_masters(:one)
  end

  test "visiting the index" do
    visit town_masters_url
    assert_selector "h1", text: "Town Masters"
  end

  test "creating a Town master" do
    visit town_masters_url
    click_on "New Town Master"

    fill_in "District", with: @town_master.district_id
    fill_in "Name", with: @town_master.name
    fill_in "Town center gps", with: @town_master.town_center_gps
    fill_in "Town", with: @town_master.town_id
    click_on "Create Town master"

    assert_text "Town master was successfully created"
    click_on "Back"
  end

  test "updating a Town master" do
    visit town_masters_url
    click_on "Edit", match: :first

    fill_in "District", with: @town_master.district_id
    fill_in "Name", with: @town_master.name
    fill_in "Town center gps", with: @town_master.town_center_gps
    fill_in "Town", with: @town_master.town_id
    click_on "Update Town master"

    assert_text "Town master was successfully updated"
    click_on "Back"
  end

  test "destroying a Town master" do
    visit town_masters_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Town master was successfully destroyed"
  end
end
