# frozen_string_literal: true

require_relative '../../app/models/delivery'

# Controller for the enpoint responsible to return the Deliveries Probabilities
# rubocop:disable Naming/AccessorMethodName
class DeliveryProbabilitiesController < ApplicationController
  # before_action :set_get_delivery_probability, only: %i[show update destroy]

  # GET /delivery_probabilities
  def index
    set_get_data_to_process
    json_to_return = {}

    render json: json_to_return, status: :ok, content_type: 'application/json'
  end

  private

  def set_get_data_to_process
    @delivery_probability = {}
    get_delivery_probability_params
    @origin_city                = params.fetch :origin_city
    @destination_city           = params.fetch :destination_city
    @number_of_tests            = params.fetch :number_of_tests, 1000
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
  def delivery_probability_params
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
# rubocop:enable Naming/AccessorMethodName
# STASHED
# require_relative '../../app/models/delivery'
#
# class DeliveryProbabilitiesController < ApplicationController
#   # before_action :set_get_delivery_probability, only: %i[show update destroy]
#
#   # GET /delivery_probabilities
#   def index
#     set_get_data_to_process
#     data_from_db = get_array_of_ids_from_tables_to_process
#
#     render json: {}, status: :ok, content_type: 'application/json'
#   end
#
#   private
#
#   def set_get_data_to_process
#     delivery_probabilities_params
#     @origin_city               = params.fetch :origin_city
#     @destination_city          = params.fetch :destination_city
#     @number_of_tests           = params.fetch :number_of_tests, 1000
#     @number_of_generated_seeds = params.fetch :number_of_generated_seeds, 500
#
#     # optional params TODO: Check if its interesting to get this data
#     # @expected_time = params[:expected_time]
#     # @number_of_items = params[:number_of_items]
#     # @number_of_items_type = params[:number_of_items_type]
#   end
#
#   # Use callbacks to share common setup or constraints between actions.
#   # def set_get_delivery_probability
#   #   @get_delivery_probability = GetDeliveryProbability.find(params[:id])
#   # end
#
#   #   Only allow a trusted parameter "white list" through.
#   def delivery_probabilities_params
#     params.require(%i[origin_city destination_city])
#   end
#
#   def get_array_of_ids_from_tables_to_process
#     hash_result                             = Delivery.steps_ids_based_on_city_deliveries @origin_city, @destination_city
#     data_from_db                            = {}
#     data_from_db['picking_time_ids']        = hash_result.fetch :picking_time_id, default: []
#     data_from_db['load_time_ids']           = hash_result.fetch :load_time_id, default: []
#     data_from_db['transportation_time_ids'] = hash_result.fetch :transportation_time_id, default: []
#     data_from_db['receive_time_ids']        = hash_result.fetch :receive_time_id, default: []
#     data_from_db['storage_time_ids']        = hash_result.fetch :storage_time_id, default: []
#     data_from_db
#   end
#
#   def get_steps_durations_from_tables_based_on_ids_list(ids_hash)
#     ids_lists                            = {}
#     ids_lists['picking_time_ids']        = PickingTime.get_durations_time_based_on_ids_list(ids_hash['picking_time_ids'] ||= [])
#     ids_lists['load_time_ids']           = LoadTime.get_durations_time_based_on_ids_list(ids_hash['load_time_ids'] ||= [])
#     ids_lists['transportation_time_ids'] = TransportationTime.get_durations_time_based_on_ids_list(ids_hash['transportation_time_ids'] ||= [])
#     ids_lists['receive_time_ids']        = ReceiveTime.get_durations_time_based_on_ids_list(ids_hash['receive_time_ids'] ||= [])
#     ids_lists['storage_time_ids']        = StorageTime.get_durations_time_based_on_ids_list(ids_hash['storage_time_ids'] ||= [])
#   end
# end
