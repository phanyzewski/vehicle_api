# frozen_string_literal: true

class Functions::UpdateVehicleOptionsFunction < GraphQL::Function
  argument :vin, !types.ID
  argument :option_included, !types.Boolean
  argument :name, !types.String

  type Types::OptionObjectType

  def call(_obj, args, _ctx)
    vehicle_option = Vehicle.find_by(vin: args[:vin]).options.find { |opt| opt.name == args[:name] }
    return nil unless vehicle_option

    vehicle_option.option_included = args[:option_included]
    vehicle_option.save!

    vehicle_option
  end
end
