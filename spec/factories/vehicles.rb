# frozen_string_literal: true

FactoryBot.define do
  factory :vehicle do
    association :vehicle_model, strategy: :build

    vin { Faker::Vehicle.vin }
    mileage { Faker::Number.between(500, 999_999) }
    options { FactoryBot.create_list(:option, 5) }
  end
end
