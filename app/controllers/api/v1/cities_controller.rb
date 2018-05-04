class Api::V1::CitiesController < ApplicationController
  before_action :set_api_v1_city, only: [:show, :update, :destroy]

  # GET /api/v1/cities
  # GET /api/v1/cities.json
  def index
    @api_v1_cities = Api::V1::City.all
  end

  # GET /api/v1/cities/1
  # GET /api/v1/cities/1.json
  def show
  end

  # POST /api/v1/cities
  # POST /api/v1/cities.json
  def create
    @api_v1_city = Api::V1::City.new(api_v1_city_params)

    if @api_v1_city.save
      render :show, status: :created, location: @api_v1_city
    else
      render json: @api_v1_city.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/cities/1
  # PATCH/PUT /api/v1/cities/1.json
  def update
    if @api_v1_city.update(api_v1_city_params)
      render :show, status: :ok, location: @api_v1_city
    else
      render json: @api_v1_city.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/cities/1
  # DELETE /api/v1/cities/1.json
  def destroy
    @api_v1_city.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_city
      @api_v1_city = Api::V1::City.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def api_v1_city_params
      params.require(:api_v1_city).permit(:name, :state, :country)
    end
end
