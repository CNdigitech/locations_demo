require 'test_helper'

class PoliticalPartyMastersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @political_party_master = political_party_masters(:one)
  end

  test "should get index" do
    get political_party_masters_url
    assert_response :success
  end

  test "should get new" do
    get new_political_party_master_url
    assert_response :success
  end

  test "should create political_party_master" do
    assert_difference('PoliticalPartyMaster.count') do
      post political_party_masters_url, params: { political_party_master: { contact_number: @political_party_master.contact_number, district_id: @political_party_master.district_id, email_address: @political_party_master.email_address, hq_address_line_1: @political_party_master.hq_address_line_1, hq_address_line_2: @political_party_master.hq_address_line_2, image_path: @political_party_master.image_path, name: @political_party_master.name, party_initial: @political_party_master.party_initial, party_logo: @political_party_master.party_logo, political_party_id: @political_party_master.political_party_id, region_id: @political_party_master.region_id, town_id: @political_party_master.town_id } }
    end

    assert_redirected_to political_party_master_url(PoliticalPartyMaster.last)
  end

  test "should show political_party_master" do
    get political_party_master_url(@political_party_master)
    assert_response :success
  end

  test "should get edit" do
    get edit_political_party_master_url(@political_party_master)
    assert_response :success
  end

  test "should update political_party_master" do
    patch political_party_master_url(@political_party_master), params: { political_party_master: { contact_number: @political_party_master.contact_number, district_id: @political_party_master.district_id, email_address: @political_party_master.email_address, hq_address_line_1: @political_party_master.hq_address_line_1, hq_address_line_2: @political_party_master.hq_address_line_2, image_path: @political_party_master.image_path, name: @political_party_master.name, party_initial: @political_party_master.party_initial, party_logo: @political_party_master.party_logo, political_party_id: @political_party_master.political_party_id, region_id: @political_party_master.region_id, town_id: @political_party_master.town_id } }
    assert_redirected_to political_party_master_url(@political_party_master)
  end

  test "should destroy political_party_master" do
    assert_difference('PoliticalPartyMaster.count', -1) do
      delete political_party_master_url(@political_party_master)
    end

    assert_redirected_to political_party_masters_url
  end
end
