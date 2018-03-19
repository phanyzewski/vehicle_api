FactoryBot.define do
  factory :option do
    name { Faker::Hipster.words(1) }
    option_included false
  end
end
