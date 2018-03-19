# frozen_string_literal: true

FactoryBot.define do
  factory :vehicle_make do
    name { Faker::Vehicle.manufacture }
  end
end
