# frozen_string_literal: true

FactoryBot.define do
  factory :vehicle_model do
    association :vehicle_make, strategy: :build

    name { Faker::Beer.hop }
    options { [FactoryBot.create(:option)] }
  end
end
