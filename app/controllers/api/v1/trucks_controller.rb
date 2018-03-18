class Api::V1::TrucksController < ApplicationController
  before_action :set_api_v1_truck, only: [:show, :update, :destroy]

  # GET /api/v1/trucks
  # GET /api/v1/trucks.json
  def index
    @api_v1_trucks = Api::V1::Truck.all
  end

  # GET /api/v1/trucks/1
  # GET /api/v1/trucks/1.json
  def show
  end

  # POST /api/v1/trucks
  # POST /api/v1/trucks.json
  def create
    @api_v1_truck = Api::V1::Truck.new(api_v1_truck_params)

    if @api_v1_truck.save
      render :show, status: :created, location: @api_v1_truck
    else
      render json: @api_v1_truck.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/trucks/1
  # PATCH/PUT /api/v1/trucks/1.json
  def update
    if @api_v1_truck.update(api_v1_truck_params)
      render :show, status: :ok, location: @api_v1_truck
    else
      render json: @api_v1_truck.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/trucks/1
  # DELETE /api/v1/trucks/1.json
  def destroy
    @api_v1_truck.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_truck
      @api_v1_truck = Api::V1::Truck.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def api_v1_truck_params
      params.require(:api_v1_truck).permit(:driver_id, :model)
    end
end
