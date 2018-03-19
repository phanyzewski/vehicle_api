FactoryBot.define do
  factory :vehicle do
    association :vehicle_model, strategy: :build

    vin { Faker::Vehicle.vin }
    year { Faker::Number.between(1884, Time.zone.today.year) }
    options { FactoryBot.create_list(:option, 5) }
  end
end
