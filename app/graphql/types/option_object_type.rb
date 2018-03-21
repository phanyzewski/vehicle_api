# frozen_string_literal: true

Types::OptionObjectType = GraphQL::ObjectType.define do
  name 'Option'
  description 'An option, sometimes it is a standard option included with a particular make/model,
    sometimes it is extra and specific only to the vehicle itself'
  field :name, types.String
  field :option_included, types.Boolean
  field :vehicle_models, types[Types::VehicleModelObjectType]
  field :vehicles, types[Types::VehicleObjectType]
end
