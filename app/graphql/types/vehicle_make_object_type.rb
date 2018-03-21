# frozen_string_literal: true

Types::VehicleMakeObjectType = GraphQL::ObjectType.define do
  name 'VehicleMake'
  description 'The make, or manufacturer, of a vehilce'
  field :name, types.String
  field :vehicle_models, types[Types::VehicleModelObjectType]
  field :vehicles, types[Types::VehicleObjectType]
end
