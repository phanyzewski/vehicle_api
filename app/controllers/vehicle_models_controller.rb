class VehicleModelsController < ApplicationController
  before_action :set_vehicle_model, only: [:show, :update, :destroy]

  def index
    @vehicle_models = VehicleModel.all
    json_response(@vehicle_models)
  end

  def create
    @vehicle_model = VehicleModel.create!(vehicle_model_params)
    json_response(@vehicle_model, :created)
  end

  def show
    json_response(@vehicle_model)
  end

  def update
    @vehicle_model.update(vehicle_model_params)
    head :no_content
  end

  def destroy
    @vehicle_model.destroy
    head :no_content
  end

  private

  def vehicle_model_params
    params.permit(:name, :vehicle_make_id)
  end

  def set_vehicle_model
    @vehicle_model = VehicleModel.find(params[:id])
  end
end
