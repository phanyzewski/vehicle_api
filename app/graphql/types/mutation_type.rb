# frozen_string_literal: true

Types::MutationType = GraphQL::ObjectType.define do
  name 'Mutation'

  field :update_vehicle_options, function: Functions::UpdateVehicleOptionsFunction.new
end
