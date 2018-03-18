class Api::V1::LoadTimesController < ApplicationController
  before_action :set_api_v1_load_time, only: [:show, :update, :destroy]

  # GET /api/v1/load_times
  # GET /api/v1/load_times.json
  def index
    @api_v1_load_times = Api::V1::LoadTime.all
  end

  # GET /api/v1/load_times/1
  # GET /api/v1/load_times/1.json
  def show
  end

  # POST /api/v1/load_times
  # POST /api/v1/load_times.json
  def create
    @api_v1_load_time = Api::V1::LoadTime.new(api_v1_load_time_params)

    if @api_v1_load_time.save
      render :show, status: :created, location: @api_v1_load_time
    else
      render json: @api_v1_load_time.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/load_times/1
  # PATCH/PUT /api/v1/load_times/1.json
  def update
    if @api_v1_load_time.update(api_v1_load_time_params)
      render :show, status: :ok, location: @api_v1_load_time
    else
      render json: @api_v1_load_time.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/load_times/1
  # DELETE /api/v1/load_times/1.json
  def destroy
    @api_v1_load_time.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_load_time
      @api_v1_load_time = Api::V1::LoadTime.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def api_v1_load_time_params
      params.require(:api_v1_load_time).permit(:duration_time, :event, :load_date)
    end
end
