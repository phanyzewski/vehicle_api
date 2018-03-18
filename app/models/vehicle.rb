class Vehicle < ApplicationRecord
  belongs_to :vehicle_model
  belongs_to :vehicle_make

  has_many :options_vehicle
  has_many :options, through: :options_vehicle

  validates :vin, uniqueness: true
end
