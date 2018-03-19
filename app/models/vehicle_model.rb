# frozen_string_literal: true

class VehicleModel < ApplicationRecord
  belongs_to :vehicle_make
  has_many :vehicles, dependent: :destroy

  has_many :options_vehicle_model
  has_many :options, through: :options_vehicle_model
end
