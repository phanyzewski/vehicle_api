# frozen_string_literal: true

class Functions::UpdateVehicleOptionsFunction < GraphQL::Function
  argument :vin, types.ID
  argument :vehicle_model_id, types.ID
  argument :selected, types.Boolean

  type Types::VehicleObjectType

  attr_accessor :ctx, :loan_number

  def call(_obj, args, ctx)
    # TODO
  end
end
