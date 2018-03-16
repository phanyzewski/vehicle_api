class Vehicle < ApplicationRecord
  belongs_to :vehicle_model
  belongs_to :vehicle_make

  has_many :options, through: :vehicle_model

  validates :vin, uniqueness: true

end
