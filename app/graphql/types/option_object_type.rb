# frozen_string_literal: true

Types::OptionObjectType = GraphQL::ObjectType.define do
  name 'Option'
  field :name, types.String
  field :option_included, types.Boolean
  field :models, types[Types::VehicleModelObjectType]
  field :vehicles, types[Types::VehicleObjectType]
end
