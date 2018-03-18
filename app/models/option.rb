class Option < ApplicationRecord
  has_many :options_vehicle_model, dependent: :destroy
  has_many :vehicle_models, through: :options_vehicle_model

  validates :name, presence: true
end
