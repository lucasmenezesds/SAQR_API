require 'test_helper'

class Api::V1::DeliveriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_delivery = api_v1_deliveries(:one)
  end

  test "should get index" do
    get api_v1_deliveries_url, as: :json
    assert_response :success
  end

  test "should create api_v1_delivery" do
    assert_difference('Api::V1::Delivery.count') do
      post api_v1_deliveries_url, params: { api_v1_delivery: { delivery_date: @api_v1_delivery.delivery_date, delivery_truck_id: @api_v1_delivery.delivery_truck_id, load_time_id: @api_v1_delivery.load_time_id, picking_time_id: @api_v1_delivery.picking_time_id, receive_time_id: @api_v1_delivery.receive_time_id, storage_time_id: @api_v1_delivery.storage_time_id, transportation_time_id: @api_v1_delivery.transportation_time_id } }, as: :json
    end

    assert_response 201
  end

  test "should show api_v1_delivery" do
    get api_v1_delivery_url(@api_v1_delivery), as: :json
    assert_response :success
  end

  test "should update api_v1_delivery" do
    patch api_v1_delivery_url(@api_v1_delivery), params: { api_v1_delivery: { delivery_date: @api_v1_delivery.delivery_date, delivery_truck_id: @api_v1_delivery.delivery_truck_id, load_time_id: @api_v1_delivery.load_time_id, picking_time_id: @api_v1_delivery.picking_time_id, receive_time_id: @api_v1_delivery.receive_time_id, storage_time_id: @api_v1_delivery.storage_time_id, transportation_time_id: @api_v1_delivery.transportation_time_id } }, as: :json
    assert_response 200
  end

  test "should destroy api_v1_delivery" do
    assert_difference('Api::V1::Delivery.count', -1) do
      delete api_v1_delivery_url(@api_v1_delivery), as: :json
    end

    assert_response 204
  end
end
