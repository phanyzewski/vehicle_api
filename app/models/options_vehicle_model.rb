class OptionsVehicleModel < ApplicationRecord
  belongs_to :option
  belongs_to :vehicle_model
end
