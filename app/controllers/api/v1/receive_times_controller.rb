class Api::V1::ReceiveTimesController < ApplicationController
  before_action :set_api_v1_receive_time, only: [:show, :update, :destroy]

  # GET /api/v1/receive_times
  # GET /api/v1/receive_times.json
  def index
    @api_v1_receive_times = Api::V1::ReceiveTime.all
  end

  # GET /api/v1/receive_times/1
  # GET /api/v1/receive_times/1.json
  def show
  end

  # POST /api/v1/receive_times
  # POST /api/v1/receive_times.json
  def create
    @api_v1_receive_time = Api::V1::ReceiveTime.new(api_v1_receive_time_params)

    if @api_v1_receive_time.save
      render :show, status: :created, location: @api_v1_receive_time
    else
      render json: @api_v1_receive_time.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/receive_times/1
  # PATCH/PUT /api/v1/receive_times/1.json
  def update
    if @api_v1_receive_time.update(api_v1_receive_time_params)
      render :show, status: :ok, location: @api_v1_receive_time
    else
      render json: @api_v1_receive_time.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/receive_times/1
  # DELETE /api/v1/receive_times/1.json
  def destroy
    @api_v1_receive_time.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_receive_time
      @api_v1_receive_time = Api::V1::ReceiveTime.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def api_v1_receive_time_params
      params.require(:api_v1_receive_time).permit(:duration_time, :event, :received_date)
    end
end
