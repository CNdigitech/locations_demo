require "application_system_test_case"

class PollingStationAgentsTest < ApplicationSystemTestCase
  setup do
    @polling_station_agent = polling_station_agents(:one)
  end

  test "visiting the index" do
    visit polling_station_agents_url
    assert_selector "h1", text: "Polling Station Agents"
  end

  test "creating a Polling station agent" do
    visit polling_station_agents_url
    click_on "New Polling Station Agent"

    check "Active status" if @polling_station_agent.active_status
    fill_in "Agent", with: @polling_station_agent.agent_id
    fill_in "Agent photo", with: @polling_station_agent.agent_photo
    fill_in "Agent signature image", with: @polling_station_agent.agent_signature_image
    fill_in "City", with: @polling_station_agent.city
    fill_in "Constituency", with: @polling_station_agent.constituency_id
    check "Del status" if @polling_station_agent.del_status
    fill_in "Email address", with: @polling_station_agent.email_address
    fill_in "Firstname", with: @polling_station_agent.firstname
    fill_in "Gender", with: @polling_station_agent.gender_id
    fill_in "Gps coordinates", with: @polling_station_agent.gps_coordinates
    fill_in "Hq address line 1", with: @polling_station_agent.hq_address_line_1
    fill_in "Hq address line 2", with: @polling_station_agent.hq_address_line_2
    fill_in "Image path", with: @polling_station_agent.image_path
    fill_in "Lastname", with: @polling_station_agent.lastname
    fill_in "Nearest landmark", with: @polling_station_agent.nearest_landmark
    fill_in "Phone number", with: @polling_station_agent.phone_number
    fill_in "Political party", with: @polling_station_agent.political_party_id
    fill_in "Polling station", with: @polling_station_agent.polling_station_id
    fill_in "Region", with: @polling_station_agent.region_id
    fill_in "Title", with: @polling_station_agent.title
    fill_in "Town", with: @polling_station_agent.town_id
    fill_in "User", with: @polling_station_agent.user_id
    click_on "Create Polling station agent"

    assert_text "Polling station agent was successfully created"
    click_on "Back"
  end

  test "updating a Polling station agent" do
    visit polling_station_agents_url
    click_on "Edit", match: :first

    check "Active status" if @polling_station_agent.active_status
    fill_in "Agent", with: @polling_station_agent.agent_id
    fill_in "Agent photo", with: @polling_station_agent.agent_photo
    fill_in "Agent signature image", with: @polling_station_agent.agent_signature_image
    fill_in "City", with: @polling_station_agent.city
    fill_in "Constituency", with: @polling_station_agent.constituency_id
    check "Del status" if @polling_station_agent.del_status
    fill_in "Email address", with: @polling_station_agent.email_address
    fill_in "Firstname", with: @polling_station_agent.firstname
    fill_in "Gender", with: @polling_station_agent.gender_id
    fill_in "Gps coordinates", with: @polling_station_agent.gps_coordinates
    fill_in "Hq address line 1", with: @polling_station_agent.hq_address_line_1
    fill_in "Hq address line 2", with: @polling_station_agent.hq_address_line_2
    fill_in "Image path", with: @polling_station_agent.image_path
    fill_in "Lastname", with: @polling_station_agent.lastname
    fill_in "Nearest landmark", with: @polling_station_agent.nearest_landmark
    fill_in "Phone number", with: @polling_station_agent.phone_number
    fill_in "Political party", with: @polling_station_agent.political_party_id
    fill_in "Polling station", with: @polling_station_agent.polling_station_id
    fill_in "Region", with: @polling_station_agent.region_id
    fill_in "Title", with: @polling_station_agent.title
    fill_in "Town", with: @polling_station_agent.town_id
    fill_in "User", with: @polling_station_agent.user_id
    click_on "Update Polling station agent"

    assert_text "Polling station agent was successfully updated"
    click_on "Back"
  end

  test "destroying a Polling station agent" do
    visit polling_station_agents_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Polling station agent was successfully destroyed"
  end
end
