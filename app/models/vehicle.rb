class Vehicle < ApplicationRecord
  has_one :vehicle_model
  has_one :vehicle_make
  has_many :vehicle_options
end
