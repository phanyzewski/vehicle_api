FactoryBot.define do
  factory :vehicle do
    association :vehicle_make, strategy: :build
    association :vehicle_model, strategy: :build

    vin { Faker::Vehicle.vin }
    year { Faker::Number.between(1884, Date.today.year)}
  end
end
