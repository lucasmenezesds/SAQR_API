require 'test_helper'

class Api::V1::PickingTimesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_picking_time = api_v1_picking_times(:one)
  end

  test "should get index" do
    get api_v1_picking_times_url, as: :json
    assert_response :success
  end

  test "should create api_v1_picking_time" do
    assert_difference('Api::V1::PickingTime.count') do
      post api_v1_picking_times_url, params: { api_v1_picking_time: { duration_time: @api_v1_picking_time.duration_time, number_of_items: @api_v1_picking_time.number_of_items, number_of_items_type: @api_v1_picking_time.number_of_items_type, picking_date: @api_v1_picking_time.picking_date, start_time: @api_v1_picking_time.start_time } }, as: :json
    end

    assert_response 201
  end

  test "should show api_v1_picking_time" do
    get api_v1_picking_time_url(@api_v1_picking_time), as: :json
    assert_response :success
  end

  test "should update api_v1_picking_time" do
    patch api_v1_picking_time_url(@api_v1_picking_time), params: { api_v1_picking_time: { duration_time: @api_v1_picking_time.duration_time, number_of_items: @api_v1_picking_time.number_of_items, number_of_items_type: @api_v1_picking_time.number_of_items_type, picking_date: @api_v1_picking_time.picking_date, start_time: @api_v1_picking_time.start_time } }, as: :json
    assert_response 200
  end

  test "should destroy api_v1_picking_time" do
    assert_difference('Api::V1::PickingTime.count', -1) do
      delete api_v1_picking_time_url(@api_v1_picking_time), as: :json
    end

    assert_response 204
  end
end
