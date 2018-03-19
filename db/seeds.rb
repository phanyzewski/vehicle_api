require 'faker'

model_options = []
vehicle_options = []

3.times do
  make = VehicleMake.create(name: Faker::Vehicle.manufacture)

  2.times do
    4.times do
      model_options << Option.create(name: Faker::Hipster.words(1), option_included: true)
    end

    mod = VehicleModel.create(
      name: Faker::Beer.hop,
      year: Faker::Number.between(1884, Time.zone.today.year),
      vehicle_make: make, options: model_options
      )

    4.times do
      vehicle_options << Option.create(name: Faker::Hipster.words(1),
       option_included: false
       )
    end

    5.times do
      Vehicle.create(
        vin: Faker::Vehicle.vin,
        vehicle_model: mod,
        mileage: Faker::Number.between(1000, 999999),
        options: vehicle_options
      )
    end
  end
end
