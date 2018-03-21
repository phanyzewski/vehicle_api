# frozen_string_literal: true

Types::VehicleObjectType = GraphQL::ObjectType.define do
  name 'Vehicle'
  description 'A Vehicle, commonly driven on a road'

  field :vin, types.ID
  field :mileage, types.Int
  field :vehicle_model, Types::VehicleModelObjectType
  field :vehicle_make, Types::VehicleMakeObjectType
  field :options, types[Types::OptionObjectType]
end
