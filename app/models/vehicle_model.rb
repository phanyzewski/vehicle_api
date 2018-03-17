class VehicleModel < ApplicationRecord
  belongs_to :vehicle_make
  has_many :vehicles, dependent: :nullify

  has_many :options_vehicle_model, dependent: :nullify
  has_many :options, through: :options_vehicle_model
end
