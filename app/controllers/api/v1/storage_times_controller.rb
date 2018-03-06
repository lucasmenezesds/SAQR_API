class Api::V1::StorageTimesController < ApplicationController
  before_action :set_api_v1_storage_time, only: [:show, :update, :destroy]

  # GET /api/v1/storage_times
  # GET /api/v1/storage_times.json
  def index
    @api_v1_storage_times = Api::V1::StorageTime.all
  end

  # GET /api/v1/storage_times/1
  # GET /api/v1/storage_times/1.json
  def show
  end

  # POST /api/v1/storage_times
  # POST /api/v1/storage_times.json
  def create
    @api_v1_storage_time = Api::V1::StorageTime.new(api_v1_storage_time_params)

    if @api_v1_storage_time.save
      render :show, status: :created, location: @api_v1_storage_time
    else
      render json: @api_v1_storage_time.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/storage_times/1
  # PATCH/PUT /api/v1/storage_times/1.json
  def update
    if @api_v1_storage_time.update(api_v1_storage_time_params)
      render :show, status: :ok, location: @api_v1_storage_time
    else
      render json: @api_v1_storage_time.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/storage_times/1
  # DELETE /api/v1/storage_times/1.json
  def destroy
    @api_v1_storage_time.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_storage_time
      @api_v1_storage_time = Api::V1::StorageTime.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def api_v1_storage_time_params
      params.require(:api_v1_storage_time).permit(:duration_time, :event, :storage_date)
    end
end
