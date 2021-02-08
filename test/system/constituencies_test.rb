require "application_system_test_case"

class ConstituenciesTest < ApplicationSystemTestCase
  setup do
    @constituency = constituencies(:one)
  end

  test "visiting the index" do
    visit constituencies_url
    assert_selector "h1", text: "Constituencies"
  end

  test "creating a Constituency" do
    visit constituencies_url
    click_on "New Constituency"

    fill_in "Constituency", with: @constituency.constituency_id
    fill_in "District", with: @constituency.district_id
    fill_in "Ec constituency code", with: @constituency.ec_constituency_code
    fill_in "Name", with: @constituency.name
    fill_in "Registered voters", with: @constituency.registered_voters
    click_on "Create Constituency"

    assert_text "Constituency was successfully created"
    click_on "Back"
  end

  test "updating a Constituency" do
    visit constituencies_url
    click_on "Edit", match: :first

    fill_in "Constituency", with: @constituency.constituency_id
    fill_in "District", with: @constituency.district_id
    fill_in "Ec constituency code", with: @constituency.ec_constituency_code
    fill_in "Name", with: @constituency.name
    fill_in "Registered voters", with: @constituency.registered_voters
    click_on "Update Constituency"

    assert_text "Constituency was successfully updated"
    click_on "Back"
  end

  test "destroying a Constituency" do
    visit constituencies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Constituency was successfully destroyed"
  end
end
