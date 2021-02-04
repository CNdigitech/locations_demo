require 'test_helper'

class CountryMastersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @country_master = country_masters(:one)
  end

  test "should get index" do
    get country_masters_url
    assert_response :success
  end

  test "should get new" do
    get new_country_master_url
    assert_response :success
  end

  test "should create country_master" do
    assert_difference('CountryMaster.count') do
      post country_masters_url, params: { country_master: { active_status: @country_master.active_status, assigned_code: @country_master.assigned_code, continent_code: @country_master.continent_code, del_status: @country_master.del_status, name: @country_master.name } }
    end

    assert_redirected_to country_master_url(CountryMaster.last)
  end

  test "should show country_master" do
    get country_master_url(@country_master)
    assert_response :success
  end

  test "should get edit" do
    get edit_country_master_url(@country_master)
    assert_response :success
  end

  test "should update country_master" do
    patch country_master_url(@country_master), params: { country_master: { active_status: @country_master.active_status, assigned_code: @country_master.assigned_code, continent_code: @country_master.continent_code, del_status: @country_master.del_status, name: @country_master.name } }
    assert_redirected_to country_master_url(@country_master)
  end

  test "should destroy country_master" do
    assert_difference('CountryMaster.count', -1) do
      delete country_master_url(@country_master)
    end

    assert_redirected_to country_masters_url
  end
end
