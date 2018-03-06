require 'test_helper'

class Api::V1::DeliveryTrucksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_delivery_truck = api_v1_delivery_trucks(:one)
  end

  test "should get index" do
    get api_v1_delivery_trucks_url, as: :json
    assert_response :success
  end

  test "should create api_v1_delivery_truck" do
    assert_difference('Api::V1::DeliveryTruck.count') do
      post api_v1_delivery_trucks_url, params: { api_v1_delivery_truck: { truck_id: @api_v1_delivery_truck.truck_id } }, as: :json
    end

    assert_response 201
  end

  test "should show api_v1_delivery_truck" do
    get api_v1_delivery_truck_url(@api_v1_delivery_truck), as: :json
    assert_response :success
  end

  test "should update api_v1_delivery_truck" do
    patch api_v1_delivery_truck_url(@api_v1_delivery_truck), params: { api_v1_delivery_truck: { truck_id: @api_v1_delivery_truck.truck_id } }, as: :json
    assert_response 200
  end

  test "should destroy api_v1_delivery_truck" do
    assert_difference('Api::V1::DeliveryTruck.count', -1) do
      delete api_v1_delivery_truck_url(@api_v1_delivery_truck), as: :json
    end

    assert_response 204
  end
end
