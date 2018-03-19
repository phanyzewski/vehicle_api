# frozen_string_literal: true

class VehicleMakeSerializer
  include FastJsonapi::ObjectSerializer
  set_type :vehicle_make
  attributes :name
  has_many :vehicles, serializer: :vehicle_serializer
  has_many :vehicle_models, serializer: :vehicle_model_serializer
end
