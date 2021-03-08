require "application_system_test_case"

class PoliticalPartyMastersTest < ApplicationSystemTestCase
  setup do
    @political_party_master = political_party_masters(:one)
  end

  test "visiting the index" do
    visit political_party_masters_url
    assert_selector "h1", text: "Political Party Masters"
  end

  test "creating a Political party master" do
    visit political_party_masters_url
    click_on "New Political Party Master"

    fill_in "Contact number", with: @political_party_master.contact_number
    fill_in "District", with: @political_party_master.district_id
    fill_in "Email address", with: @political_party_master.email_address
    fill_in "Hq address line 1", with: @political_party_master.hq_address_line_1
    fill_in "Hq address line 2", with: @political_party_master.hq_address_line_2
    fill_in "Image path", with: @political_party_master.image_path
    fill_in "Name", with: @political_party_master.name
    fill_in "Party initial", with: @political_party_master.party_initial
    fill_in "Party logo", with: @political_party_master.party_logo
    fill_in "Political party", with: @political_party_master.political_party_id
    fill_in "Region", with: @political_party_master.region_id
    fill_in "Town", with: @political_party_master.town_id
    click_on "Create Political party master"

    assert_text "Political party master was successfully created"
    click_on "Back"
  end

  test "updating a Political party master" do
    visit political_party_masters_url
    click_on "Edit", match: :first

    fill_in "Contact number", with: @political_party_master.contact_number
    fill_in "District", with: @political_party_master.district_id
    fill_in "Email address", with: @political_party_master.email_address
    fill_in "Hq address line 1", with: @political_party_master.hq_address_line_1
    fill_in "Hq address line 2", with: @political_party_master.hq_address_line_2
    fill_in "Image path", with: @political_party_master.image_path
    fill_in "Name", with: @political_party_master.name
    fill_in "Party initial", with: @political_party_master.party_initial
    fill_in "Party logo", with: @political_party_master.party_logo
    fill_in "Political party", with: @political_party_master.political_party_id
    fill_in "Region", with: @political_party_master.region_id
    fill_in "Town", with: @political_party_master.town_id
    click_on "Update Political party master"

    assert_text "Political party master was successfully updated"
    click_on "Back"
  end

  test "destroying a Political party master" do
    visit political_party_masters_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Political party master was successfully destroyed"
  end
end
