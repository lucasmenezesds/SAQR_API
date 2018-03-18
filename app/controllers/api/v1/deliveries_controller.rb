class Api::V1::DeliveriesController < ApplicationController
  before_action :set_api_v1_delivery, only: [:show, :update, :destroy]

  # GET /api/v1/deliveries
  # GET /api/v1/deliveries.json
  def index
    @api_v1_deliveries = Api::V1::Delivery.all
  end

  # GET /api/v1/deliveries/1
  # GET /api/v1/deliveries/1.json
  def show
  end

  # POST /api/v1/deliveries
  # POST /api/v1/deliveries.json
  def create
    @api_v1_delivery = Api::V1::Delivery.new(api_v1_delivery_params)

    if @api_v1_delivery.save
      render :show, status: :created, location: @api_v1_delivery
    else
      render json: @api_v1_delivery.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/deliveries/1
  # PATCH/PUT /api/v1/deliveries/1.json
  def update
    if @api_v1_delivery.update(api_v1_delivery_params)
      render :show, status: :ok, location: @api_v1_delivery
    else
      render json: @api_v1_delivery.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/deliveries/1
  # DELETE /api/v1/deliveries/1.json
  def destroy
    @api_v1_delivery.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_delivery
      @api_v1_delivery = Api::V1::Delivery.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def api_v1_delivery_params
      params.require(:api_v1_delivery).permit(:picking_time_id, :load_time_id, :transportation_time_id, :receive_time_id, :storage_time_id, :delivery_date)
    end
end
