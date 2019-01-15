require_relative '../../app/models/delivery'

class GetDeliveryProbabilitiesController < ApplicationController
  # before_action :set_get_delivery_probability, only: %i[show update destroy]

  # GET /get_delivery_probabilities
  def index
    set_get_data_to_process
    json_to_return = {}

    render json: json_to_return, status: :ok, content_type: 'application/json'
  end

  private

  def set_get_data_to_process
    @delivery_probability = {}
    get_delivery_probability_params
    @origin_city = params.fetch :origin_city
    @destination_city = params.fetch :destination_city
    @number_of_tests = params.fetch :number_of_tests, 1000
    @generated_numbers_quantity = params.fetch :generated_numbers_quantity, 500
    # optional params TODO: Check if its interesting to get this data
    # @expected_time = params[:expected_time]
    # @number_of_items = params[:number_of_items]
    # @number_of_items_type = params[:number_of_items_type]

    @data_to_process = Delivery.get_duration_times @origin_city, @destination_city
  end

  # Use callbacks to share common setup or constraints between actions.
  # def set_get_delivery_probability
  #   @get_delivery_probability = GetDeliveryProbability.find(params[:id])
  # end

  #   Only allow a trusted parameter "white list" through.
  def get_delivery_probability_params
    params.require(%i[origin_city destination_city])
  end

  # def
  #
  # end
  #
  # TODO DELIVERY STEPS
  #
  # picking
  # loading
  # transportation
  # receiving
  # storage
  #
  # MODEL
  # get_ID_of_all_deliveries_for city 1 & 10 \/
  # get [IDs ARRAY] from deliveries where origin=city1 && destination=city2
  #
  # get durations from picking where delivery_id IN [array]
  # get durations from loading where delivery_id IN [array]
  # get durations from transportation where delivery_id IN [array]
  # get durations from receiving where delivery_id IN [array]
  # get durations from storage where delivery_id IN [array]
  #
  #
  # 

end
