class Api::V1::DriversController < ApplicationController
  before_action :set_api_v1_driver, only: [:show, :update, :destroy]

  # GET /api/v1/drivers
  # GET /api/v1/drivers.json
  def index
    @api_v1_drivers = Api::V1::Driver.all
  end

  # GET /api/v1/drivers/1
  # GET /api/v1/drivers/1.json
  def show
  end

  # POST /api/v1/drivers
  # POST /api/v1/drivers.json
  def create
    @api_v1_driver = Api::V1::Driver.new(api_v1_driver_params)

    if @api_v1_driver.save
      render :show, status: :created, location: @api_v1_driver
    else
      render json: @api_v1_driver.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/drivers/1
  # PATCH/PUT /api/v1/drivers/1.json
  def update
    if @api_v1_driver.update(api_v1_driver_params)
      render :show, status: :ok, location: @api_v1_driver
    else
      render json: @api_v1_driver.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/drivers/1
  # DELETE /api/v1/drivers/1.json
  def destroy
    @api_v1_driver.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_driver
      @api_v1_driver = Api::V1::Driver.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def api_v1_driver_params
      params.require(:api_v1_driver).permit(:name, :age, :contact)
    end
end
