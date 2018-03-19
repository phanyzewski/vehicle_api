# frozen_string_literal: true

class OptionSerializer
  include FastJsonapi::ObjectSerializer
  set_type :option
  attributes :name, :option_included

  has_many :vehicles, serializer: :vehicle_serializer
  has_many :vehicle_models, serializer: :vehicle_model_serializer
end
