class GetDeliveryProbabilitiesController < ApplicationController
  # before_action :set_get_delivery_probability, only: %i[show update destroy]

  # GET /get_delivery_probabilities
  def index
    @origin_city = params[:origin_city]
    @destination_city = params[:destination_city]
    @expected_time = params[:expected_time]
    # optional params
    @number_of_items = params[:number_of_items]
    @number_of_items_type = params[:number_of_items_type]
    json_to_return = { origin_city: @origin_city,
                       destination_city: @destination_city,
                       expected_time: @expected_time,
                       number_of_items: @number_of_items,
                       number_of_items_type: @number_of_items_type }

    render json: json_to_return
  end

  # # GET /get_delivery_probabilities/1
  # def show
  #   render json: @get_delivery_probability
  # end

  # # POST /get_delivery_probabilities
  # def create
  #   @get_delivery_probability = GetDeliveryProbability.new(get_delivery_probability_params)
  #
  #   if @get_delivery_probability.save
  #     render json: @get_delivery_probability, status: :created, location: @get_delivery_probability
  #   else
  #     render json: @get_delivery_probability.errors, status: :unprocessable_entity
  #   end
  # end
  #
  # # PATCH/PUT /get_delivery_probabilities/1
  # def update
  #   if @get_delivery_probability.update(get_delivery_probability_params)
  #     render json: @get_delivery_probability
  #   else
  #     render json: @get_delivery_probability.errors, status: :unprocessable_entity
  #   end
  # end
  #
  # # DELETE /get_delivery_probabilities/1
  # def destroy
  #   @get_delivery_probability.destroy
  # end
  #
  # private
  #
  # # Use callbacks to share common setup or constraints between actions.
  # def set_get_delivery_probability
  #   @get_delivery_probability = GetDeliveryProbability.find(params[:id])
  # end
  #
  # # Only allow a trusted parameter "white list" through.
  # def get_delivery_probability_params
  #   params.fetch(:get_delivery_probability, {})
  # end
end
