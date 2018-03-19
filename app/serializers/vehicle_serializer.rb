# frozen_string_literal: true

class VehicleSerializer
  include FastJsonapi::ObjectSerializer
  set_type :vehicle
  set_id :id
  attributes :vin, :mileage, :owner

  has_many :options, serializer: :vehicle_options_serializer
  belongs_to :vehicle_model
  belongs_to :vehicle_make
end
