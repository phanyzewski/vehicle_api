class Option < ApplicationRecord
  has_many :options_vehicle_model, dependent: :destroy
  has_many :vehicle_models, through: :options_vehicle_model

  has_many :options_vehicle, dependent: :destroy
  has_many :vehicles, through: :options_vehicle

  validates :name, presence: true
end
