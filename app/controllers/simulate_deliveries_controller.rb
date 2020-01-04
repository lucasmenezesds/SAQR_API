# frozen_string_literal: true

# Controller that will receive the data to create the simulation
class SimulateDeliveriesController < ApplicationController
  before_action :set_simulate_delivery, only: %i[show update destroy]

  # GET /simulate_deliveries
  # def index
  #  @simulate_deliveries = SimulateDelivery.all
  #
  #  render json: @simulate_deliveries
  # end

  # GET /simulate_deliveries/1
  # def show
  #  render json: @simulate_delivery
  # end

  # POST /simulate_deliveries
  def create
    simulation_params = simulate_delivery_params
    steps = simulation_params.fetch(:steps)

    number_of_samples = simulation_params.fetch(:number_of_samples)
    number_of_simulations = simulation_params.fetch(:number_of_simulations)
    label = simulation_params.fetch(:label, nil)

    simulations_mean = SimulateDeliveriesHelpers.calculate_mean_for_steps(number_of_simulations, number_of_samples, steps)
    simulation_data = SimulateDeliveriesHelpers.simulations_statistical_data(simulations_mean)
    simulation_data[:number_of_samples] = number_of_samples
    simulation_data[:number_of_simulations] = number_of_simulations

    @simulate_delivery = SimulateDelivery.new(steps: steps, simulation_data: simulation_data, label: label)

    if @simulate_delivery.save
      render json: @simulate_delivery, status: :created, location: @simulate_deliveries
    else
      render json: @simulate_delivery.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /simulate_deliveries/1
  # def update
  #  if @simulate_delivery.update(simulate_delivery_params)
  #    render json: @simulate_delivery
  #  else
  #    render json: @simulate_delivery.errors, status: :unprocessable_entity
  #  end
  # end

  # DELETE /simulate_deliveries/1
  # def destroy
  #  @simulate_delivery.destroy
  # end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_simulate_delivery
    @simulate_delivery = SimulateDelivery.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def simulate_delivery_params
    params.require(:data).permit(:number_of_simulations, :number_of_samples, :label,
                                 steps: [:delivery_step, distribution_method: [:name, parameters: %i[id name value uppercase]]]).tap do |inner_params|
      inner_params.require(:number_of_simulations)
      inner_params.require(:number_of_samples)
      inner_params.require(:steps)
    end
  end
end
