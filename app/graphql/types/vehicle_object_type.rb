# frozen_string_literal: true

Types::VehicleObjectType = GraphQL::ObjectType.define do
  name 'Vehicle'
  field :vin, types.ID
  field :mileage, types.Int
  field :model, Types::VehicleModelObjectType
  field :make, Types::VehicleMakeObjectType
end
