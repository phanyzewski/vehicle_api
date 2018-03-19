# frozen_string_literal: true

module V1
  class VehicleMakesController < ApplicationController
    before_action :set_vehicle_make, only: %i[show update destroy]

    def index
      @vehicle_makes = VehicleMake.all
      json_response(@vehicle_makes)
    end

    def create
      @vehicle_make = VehicleMake.create!(vehicle_make_params)
      json_response(@vehicle_make, :created)
    end

    def show
      json_response(@vehicle_make)
    end

    def update
      @vehicle_make.update(vehicle_make_params)
      head :no_content
    end

    def destroy
      @vehicle_make.destroy
      head :no_content
    end

    private

    def vehicle_make_params
      params.permit(:name)
    end

    def set_vehicle_make
      @vehicle_make = VehicleMake.find(params[:id])
    end
  end
end
