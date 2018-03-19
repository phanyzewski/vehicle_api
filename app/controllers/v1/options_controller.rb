# frozen_string_literal: true

module V1
  class OptionsController < ApplicationController
    before_action :set_option, only: %i[show update destroy]
    before_action :set_options, only: %i[index]

    def index
      if @options.present?
        json_string = VehicleOptionsSerializer.new(@options).serialized_json
      else
        @options = Option.all
        json_string = OptionSerializer.new(@options).serialized_json
      end

      json_response(json_string)
    end

    def create
      @option = Option.create!(option_params)
      json_response(@option, :created)
    end

    def show
      json_string = OptionSerializer.new(@option).serialized_json
      json_response(json_string)
    end

    def update
      @option.update(option_included: params[:option_included])
      head :no_content
    end

    def destroy
      @option.destroy
      head :no_content
    end

    private

    def option_params
      params.permit(:name, :option_included, :vehicle_id, :vehicle_model_id)
    end

    def set_option
      @option = Option.find(params[:id])
    end

    def set_options
      @options =
        if params[:vehicle_id]
          OptionsVehicle.where(vehicle_id: params[:vehicle_id])
        elsif params[:vehicle_model_id]
          OptionsVehicleModel.where(vehicle_model_id: params[:vehicle_model_id])
        end
    end
  end
end
