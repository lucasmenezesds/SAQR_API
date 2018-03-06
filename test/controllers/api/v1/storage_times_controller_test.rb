require 'test_helper'

class Api::V1::StorageTimesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_storage_time = api_v1_storage_times(:one)
  end

  test "should get index" do
    get api_v1_storage_times_url, as: :json
    assert_response :success
  end

  test "should create api_v1_storage_time" do
    assert_difference('Api::V1::StorageTime.count') do
      post api_v1_storage_times_url, params: { api_v1_storage_time: { duration_time: @api_v1_storage_time.duration_time, event: @api_v1_storage_time.event, storage_date: @api_v1_storage_time.storage_date } }, as: :json
    end

    assert_response 201
  end

  test "should show api_v1_storage_time" do
    get api_v1_storage_time_url(@api_v1_storage_time), as: :json
    assert_response :success
  end

  test "should update api_v1_storage_time" do
    patch api_v1_storage_time_url(@api_v1_storage_time), params: { api_v1_storage_time: { duration_time: @api_v1_storage_time.duration_time, event: @api_v1_storage_time.event, storage_date: @api_v1_storage_time.storage_date } }, as: :json
    assert_response 200
  end

  test "should destroy api_v1_storage_time" do
    assert_difference('Api::V1::StorageTime.count', -1) do
      delete api_v1_storage_time_url(@api_v1_storage_time), as: :json
    end

    assert_response 204
  end
end
