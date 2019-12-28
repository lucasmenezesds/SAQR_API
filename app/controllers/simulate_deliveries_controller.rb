class SimulateDeliveriesController < ApplicationController
  before_action :set_simulate_delivery, only: [:show, :update, :destroy]

  # GET /simulate_deliveries
  #def index
  #  @simulate_deliveries = SimulateDelivery.all
  #
  #  render json: @simulate_deliveries
  #end

  # GET /simulate_deliveries/1
  #def show
  #  render json: @simulate_delivery
  #end

  # POST /simulate_deliveries
  def create
    @simulate_delivery = simulate_delivery_params

    puts @simulate_delivery

    render json: @simulate_delivery, status: :created, location: @simulate_delivery
  end

  # PATCH/PUT /simulate_deliveries/1
  #def update
  #  if @simulate_delivery.update(simulate_delivery_params)
  #    render json: @simulate_delivery
  #  else
  #    render json: @simulate_delivery.errors, status: :unprocessable_entity
  #  end
  #end

  # DELETE /simulate_deliveries/1
  #def destroy
  #  @simulate_delivery.destroy
  #end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_simulate_delivery
    @simulate_delivery = SimulateDelivery.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def simulate_delivery_params
    params.require(:data).permit(:number_of_simulations, :number_of_samples, steps: [:delivery_step, distribution_method: [:name, parameters: %i[name value uppercase]]]).tap do |pqp|
      pqp.require(:number_of_simulations)
      pqp.require(:number_of_samples)
      pqp.require(:steps)
    end
  end
end
