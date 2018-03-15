class VehicleModel < ApplicationRecord
  belongs_to :vehicle_make
  has_many :vehicles

  has_many :options_vehicle_model
  has_many :options, through: :options_vehicle_model
end
