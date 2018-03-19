# frozen_string_literal: true

FactoryBot.define do
  factory :vehicle_model do
    association :vehicle_make, strategy: :build

    name { Faker::Beer.hop }
    year { Faker::Number.between(1884, Time.zone.today.year) }
    options { [FactoryBot.create(:option)] }
  end
end
