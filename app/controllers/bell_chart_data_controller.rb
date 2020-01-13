# frozen_string_literal: true

# require 'lib/statistical_libs/statistical_functions/normal_distribution_functions'
require_relative '../../lib/statistical_libs/statistical_functions/normal_distribution_functions'

# BellChartDataController that will return SimulateDelivery Object with other information
class BellChartDataController < ApplicationController
  include NormalDistributionFunctions
  # before_action :set_bell_chart_datum, only: %i[show update destroy]

  # FIXME: not the best thing to do, but..
  # POST /bell_chart_data
  def create
    params = bell_chart_datum_params
    simulation_id = params.fetch('simulation-id')

    intervals = []
    intervals << params.dig(:"confidence-option", :values, :from).to_f / 100.0
    to_value = params.dig(:"confidence-option", :values, :to)
    intervals << (to_value.to_f / 100.0) unless to_value.nil?

    @bell_chart_data = SimulateDelivery.find(simulation_id)

    final_payload = @bell_chart_data['simulation_data']

    zones = NormalDistributionFunctions.area_to_paint(intervals, final_payload['std_dev'], final_payload['mean'])

    final_payload['zones'] = zones

    if @bell_chart_data
      render json: { data: final_payload }, status: :created, location: @bell_chart_data, adapter: :attributes
    else
      render json: @bell_chart_data.errors, status: :unprocessable_entity
    end
  end

  private

  ## Use callbacks to share common setup or constraints between actions.
  # def set_bell_chart_datum
  #  @bell_chart_data = SimulateDelivery.find(params[:id])
  # end

  # Only allow a trusted parameter "white list" through.
  def bell_chart_datum_params
    params.require(:data).permit('simulation-id', 'confidence-option',
                                 "confidence-option": [:option, values: %i[from to]])
  end
end