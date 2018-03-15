class VehicleModel < ApplicationRecord
  has_one :vehicle_make
  has_many :models_options
  has_many :vehicle_options, through: :models_options
end
