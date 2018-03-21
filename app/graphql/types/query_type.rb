# frozen_string_literal: true

Types::QueryType = GraphQL::ObjectType.define do
  name 'Query'
  description 'The query root of the schema.'

  field :vehicle do
    type Types::VehicleObjectType

    argument :vin, !types.ID

    resolve ->(_obj, args, _ctx) {
      Vehicle.find_by(vin: args[:vin])
    }
  end

  field :manufacturer do
    description 'A company which makes vehicles.'

    type Types::VehicleMakeObjectType
    argument :name, !types.String

    resolve ->(_obj, args, _ctx) {
      VehicleMake.find_by(name: args[:name])
    }
  end

  field :model do
    description 'Models are vairations of a vehicle as defined by its manufacturer.'

    type Types::VehicleModelObjectType

    argument :vehicle_model, !types.String

    resolve ->(_obj, args, _ctx) {
      VehicleModel.find_by(name: args[:vehicle_model])
    }
  end

  field :options do
    description 'Vheicle customization, sometimes standard depending on make/model,
      sometimes extra and sepcfic to a vehicle.'

    type types[Types::OptionObjectType]

    argument :vehicle_model,  types.String
    argument :vin,            types.ID

    resolve ->(_obj, args, _ctx) {
      if args[:vin] && args[:vehicle_model]
        Vehicle.find_by(vin: args[:vin]).options && VehicleModel.find_by(name: args[:vehicle_model]).options
      elsif args[:vehicle_model]
        VehicleModel.find_by(name: args[:vehicle_model]).options
      elsif args[:vin]
        Vehicle.find_by(vin: args[:vin]).options
      end
    }
  end
end
