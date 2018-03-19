# frozen_string_literal: true

module V1
  class OptionsController < ApplicationController
    before_action :set_option, only: %i[show update destroy]

    def index
      @options = Option.all
      json_response(@options)
    end

    def create
      @option = Option.create!(option_params)
      json_response(@option, :created)
    end

    def show
      json_response(@option)
    end

    def update
      @option.update(option_params)
      head :no_content
    end

    def destroy
      @option.destroy
      head :no_content
    end

    private

    def option_params
      params.permit(:name, :option_included)
    end

    def set_option
      @option = Option.find(params[:id])
    end
  end
end
