require "application_system_test_case"

class CountryMastersTest < ApplicationSystemTestCase
  setup do
    @country_master = country_masters(:one)
  end

  test "visiting the index" do
    visit country_masters_url
    assert_selector "h1", text: "Country Masters"
  end

  test "creating a Country master" do
    visit country_masters_url
    click_on "New Country Master"

    check "Active status" if @country_master.active_status
    fill_in "Assigned code", with: @country_master.assigned_code
    fill_in "Continent code", with: @country_master.continent_code
    check "Del status" if @country_master.del_status
    fill_in "Name", with: @country_master.name
    click_on "Create Country master"

    assert_text "Country master was successfully created"
    click_on "Back"
  end

  test "updating a Country master" do
    visit country_masters_url
    click_on "Edit", match: :first

    check "Active status" if @country_master.active_status
    fill_in "Assigned code", with: @country_master.assigned_code
    fill_in "Continent code", with: @country_master.continent_code
    check "Del status" if @country_master.del_status
    fill_in "Name", with: @country_master.name
    click_on "Update Country master"

    assert_text "Country master was successfully updated"
    click_on "Back"
  end

  test "destroying a Country master" do
    visit country_masters_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Country master was successfully destroyed"
  end
end
