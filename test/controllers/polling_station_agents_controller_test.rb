require 'test_helper'

class PollingStationAgentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @polling_station_agent = polling_station_agents(:one)
  end

  test "should get index" do
    get polling_station_agents_url
    assert_response :success
  end

  test "should get new" do
    get new_polling_station_agent_url
    assert_response :success
  end

  test "should create polling_station_agent" do
    assert_difference('PollingStationAgent.count') do
      post polling_station_agents_url, params: { polling_station_agent: { active_status: @polling_station_agent.active_status, agent_id: @polling_station_agent.agent_id, agent_photo: @polling_station_agent.agent_photo, agent_signature_image: @polling_station_agent.agent_signature_image, city: @polling_station_agent.city, constituency_id: @polling_station_agent.constituency_id, del_status: @polling_station_agent.del_status, email_address: @polling_station_agent.email_address, firstname: @polling_station_agent.firstname, gender_id: @polling_station_agent.gender_id, gps_coordinates: @polling_station_agent.gps_coordinates, hq_address_line_1: @polling_station_agent.hq_address_line_1, hq_address_line_2: @polling_station_agent.hq_address_line_2, image_path: @polling_station_agent.image_path, lastname: @polling_station_agent.lastname, nearest_landmark: @polling_station_agent.nearest_landmark, phone_number: @polling_station_agent.phone_number, political_party_id: @polling_station_agent.political_party_id, polling_station_id: @polling_station_agent.polling_station_id, region_id: @polling_station_agent.region_id, title: @polling_station_agent.title, town_id: @polling_station_agent.town_id, user_id: @polling_station_agent.user_id } }
    end

    assert_redirected_to polling_station_agent_url(PollingStationAgent.last)
  end

  test "should show polling_station_agent" do
    get polling_station_agent_url(@polling_station_agent)
    assert_response :success
  end

  test "should get edit" do
    get edit_polling_station_agent_url(@polling_station_agent)
    assert_response :success
  end

  test "should update polling_station_agent" do
    patch polling_station_agent_url(@polling_station_agent), params: { polling_station_agent: { active_status: @polling_station_agent.active_status, agent_id: @polling_station_agent.agent_id, agent_photo: @polling_station_agent.agent_photo, agent_signature_image: @polling_station_agent.agent_signature_image, city: @polling_station_agent.city, constituency_id: @polling_station_agent.constituency_id, del_status: @polling_station_agent.del_status, email_address: @polling_station_agent.email_address, firstname: @polling_station_agent.firstname, gender_id: @polling_station_agent.gender_id, gps_coordinates: @polling_station_agent.gps_coordinates, hq_address_line_1: @polling_station_agent.hq_address_line_1, hq_address_line_2: @polling_station_agent.hq_address_line_2, image_path: @polling_station_agent.image_path, lastname: @polling_station_agent.lastname, nearest_landmark: @polling_station_agent.nearest_landmark, phone_number: @polling_station_agent.phone_number, political_party_id: @polling_station_agent.political_party_id, polling_station_id: @polling_station_agent.polling_station_id, region_id: @polling_station_agent.region_id, title: @polling_station_agent.title, town_id: @polling_station_agent.town_id, user_id: @polling_station_agent.user_id } }
    assert_redirected_to polling_station_agent_url(@polling_station_agent)
  end

  test "should destroy polling_station_agent" do
    assert_difference('PollingStationAgent.count', -1) do
      delete polling_station_agent_url(@polling_station_agent)
    end

    assert_redirected_to polling_station_agents_url
  end
end
