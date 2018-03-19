# frozen_string_literal: true

FactoryBot.define do
  factory :option do
    name { Faker::Hipster.words(1) }
    option_included false
  end
end
