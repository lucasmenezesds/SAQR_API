require 'test_helper'

class Api::V1::TrucksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_truck = api_v1_trucks(:one)
  end

  test "should get index" do
    get api_v1_trucks_url, as: :json
    assert_response :success
  end

  test "should create api_v1_truck" do
    assert_difference('Api::V1::Truck.count') do
      post api_v1_trucks_url, params: { api_v1_truck: { driver_id: @api_v1_truck.driver_id, model: @api_v1_truck.model } }, as: :json
    end

    assert_response 201
  end

  test "should show api_v1_truck" do
    get api_v1_truck_url(@api_v1_truck), as: :json
    assert_response :success
  end

  test "should update api_v1_truck" do
    patch api_v1_truck_url(@api_v1_truck), params: { api_v1_truck: { driver_id: @api_v1_truck.driver_id, model: @api_v1_truck.model } }, as: :json
    assert_response 200
  end

  test "should destroy api_v1_truck" do
    assert_difference('Api::V1::Truck.count', -1) do
      delete api_v1_truck_url(@api_v1_truck), as: :json
    end

    assert_response 204
  end
end
