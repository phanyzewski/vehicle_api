# frozen_string_literal: true

module V1
  class VehiclesController < ApplicationController
    before_action :set_vehicle, only: %i[show update destroy]

    def index
      @vehicles =
        if vehicle_params.present?
          Vehicle.where(vehicle_params)
        else
          Vehicle.all
        end

      json_string = VehicleSerializer.new(@vehicles).serialized_json
      json_response(json_string)
    end

    def create
      @vehicle = Vehicle.create!(vehicle_params)
      json_response(@vehicle, :created)
    end

    def show
      json_string = VehicleSerializer.new(@vehicle).serialized_json
      json_response(json_string)
    end

    def update
      @vehicle.update(vehicle_params)
      head :no_content
    end

    def destroy
      @vehicle.destroy
      head :no_content
    end

    private

    def vehicle_params
      params.permit(:vin, :year, :vehicle_make_id, :vehicle_model_id)
    end

    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
    end
  end
end
