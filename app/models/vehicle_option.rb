class VehicleOption < ApplicationRecord
  has_many :models_options
  has_many :vehicle_models, through: :models_options
end
