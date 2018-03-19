# frozen_string_literal: true
class StatusController < ApplicationController
  def index
    render json: {
      app:     'vehicle_api',
      status:  'OK',
      version: ENV['RAILS_APP_VERSION']
    }
  end
end
