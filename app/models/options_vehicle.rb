# frozen_string_literal: true

class OptionsVehicle < ApplicationRecord
  belongs_to :option
  belongs_to :vehicle
end
