require 'test_helper'

class Api::V1::TransportationTimesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_transportation_time = api_v1_transportation_times(:one)
  end

  test "should get index" do
    get api_v1_transportation_times_url, as: :json
    assert_response :success
  end

  test "should create api_v1_transportation_time" do
    assert_difference('Api::V1::TransportationTime.count') do
      post api_v1_transportation_times_url, params: { api_v1_transportation_time: { duration_time: @api_v1_transportation_time.duration_time, event: @api_v1_transportation_time.event, transportation_date: @api_v1_transportation_time.transportation_date } }, as: :json
    end

    assert_response 201
  end

  test "should show api_v1_transportation_time" do
    get api_v1_transportation_time_url(@api_v1_transportation_time), as: :json
    assert_response :success
  end

  test "should update api_v1_transportation_time" do
    patch api_v1_transportation_time_url(@api_v1_transportation_time), params: { api_v1_transportation_time: { duration_time: @api_v1_transportation_time.duration_time, event: @api_v1_transportation_time.event, transportation_date: @api_v1_transportation_time.transportation_date } }, as: :json
    assert_response 200
  end

  test "should destroy api_v1_transportation_time" do
    assert_difference('Api::V1::TransportationTime.count', -1) do
      delete api_v1_transportation_time_url(@api_v1_transportation_time), as: :json
    end

    assert_response 204
  end
end
