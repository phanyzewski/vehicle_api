class Option < ApplicationRecord
  has_many :options_vehicle_model
  has_many :vehicle_models, through: :options_vehicle_model
end
