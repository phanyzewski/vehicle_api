class VehicleMake < ApplicationRecord
  has_many :vehicles, dependent: :nullify
  has_many :vehicle_models, dependent: :nullify
end
