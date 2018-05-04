class Api::V1::DeliveryTrucksController < ApplicationController
  before_action :set_api_v1_delivery_truck, only: [:show, :update, :destroy]

  # GET /api/v1/delivery_trucks
  # GET /api/v1/delivery_trucks.json
  def index
    @api_v1_delivery_trucks = Api::V1::DeliveryTruck.all
  end

  # GET /api/v1/delivery_trucks/1
  # GET /api/v1/delivery_trucks/1.json
  def show
  end

  # POST /api/v1/delivery_trucks
  # POST /api/v1/delivery_trucks.json
  def create
    @api_v1_delivery_truck = Api::V1::DeliveryTruck.new(api_v1_delivery_truck_params)

    if @api_v1_delivery_truck.save
      render :show, status: :created, location: @api_v1_delivery_truck
    else
      render json: @api_v1_delivery_truck.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/delivery_trucks/1
  # PATCH/PUT /api/v1/delivery_trucks/1.json
  def update
    if @api_v1_delivery_truck.update(api_v1_delivery_truck_params)
      render :show, status: :ok, location: @api_v1_delivery_truck
    else
      render json: @api_v1_delivery_truck.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/delivery_trucks/1
  # DELETE /api/v1/delivery_trucks/1.json
  def destroy
    @api_v1_delivery_truck.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_delivery_truck
      @api_v1_delivery_truck = Api::V1::DeliveryTruck.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def api_v1_delivery_truck_params
      params.require(:api_v1_delivery_truck).permit(:truck_id)
    end
end
