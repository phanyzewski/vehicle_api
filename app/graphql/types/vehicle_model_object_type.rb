# frozen_string_literal: true

Types::VehicleModelObjectType = GraphQL::ObjectType.define do
  name 'VehicleModel'
  description 'The model of a vehicle'

  field :name, types.String
  field :vehicles, types[Types::VehicleObjectType]
  field :options, types[Types::OptionObjectType]
end
