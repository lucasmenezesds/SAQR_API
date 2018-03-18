class Api::V1::CargosController < ApplicationController
  before_action :set_api_v1_cargo, only: [:show, :update, :destroy]

  # GET /api/v1/cargos
  # GET /api/v1/cargos.json
  def index
    @api_v1_cargos = Api::V1::Cargo.all
  end

  # GET /api/v1/cargos/1
  # GET /api/v1/cargos/1.json
  def show
  end

  # POST /api/v1/cargos
  # POST /api/v1/cargos.json
  def create
    @api_v1_cargo = Api::V1::Cargo.new(api_v1_cargo_params)

    if @api_v1_cargo.save
      render :show, status: :created, location: @api_v1_cargo
    else
      render json: @api_v1_cargo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/cargos/1
  # PATCH/PUT /api/v1/cargos/1.json
  def update
    if @api_v1_cargo.update(api_v1_cargo_params)
      render :show, status: :ok, location: @api_v1_cargo
    else
      render json: @api_v1_cargo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/cargos/1
  # DELETE /api/v1/cargos/1.json
  def destroy
    @api_v1_cargo.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_cargo
      @api_v1_cargo = Api::V1::Cargo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def api_v1_cargo_params
      params.require(:api_v1_cargo).permit(:truck_id, :delivery_id)
    end
end
