# frozen_string_literal: true

class VehicleModelSerializer
  include FastJsonapi::ObjectSerializer
  set_type :vehicle_model
  attributes :name, :year, :category, :trim

  has_many :options, serializer: :vehicle_options_serializer
  has_many :vehicles, serializer: :vehicle_serializer
  belongs_to :vehicle_make
end
