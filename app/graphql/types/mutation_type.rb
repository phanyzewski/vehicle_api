# frozen_string_literal: true

Types::MutationType = GraphQL::ObjectType.define do
  name 'Mutation'
  description 'Update whether or not a vehicle is included with this non standard option'

  field :update_vehicle_options, function: Functions::UpdateVehicleOptionsFunction.new
end
