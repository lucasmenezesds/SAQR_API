require 'test_helper'

class Api::V1::DriversControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_driver = api_v1_drivers(:one)
  end

  test "should get index" do
    get api_v1_drivers_url, as: :json
    assert_response :success
  end

  test "should create api_v1_driver" do
    assert_difference('Api::V1::Driver.count') do
      post api_v1_drivers_url, params: { api_v1_driver: { age: @api_v1_driver.age, contact: @api_v1_driver.contact, name: @api_v1_driver.name } }, as: :json
    end

    assert_response 201
  end

  test "should show api_v1_driver" do
    get api_v1_driver_url(@api_v1_driver), as: :json
    assert_response :success
  end

  test "should update api_v1_driver" do
    patch api_v1_driver_url(@api_v1_driver), params: { api_v1_driver: { age: @api_v1_driver.age, contact: @api_v1_driver.contact, name: @api_v1_driver.name } }, as: :json
    assert_response 200
  end

  test "should destroy api_v1_driver" do
    assert_difference('Api::V1::Driver.count', -1) do
      delete api_v1_driver_url(@api_v1_driver), as: :json
    end

    assert_response 204
  end
end
