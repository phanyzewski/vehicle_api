class VehicleMake < ApplicationRecord
  has_many :vehicles, dependent: :destroy
  has_many :vehicle_models, dependent: :destroy

  validates :name, presence: true
end
