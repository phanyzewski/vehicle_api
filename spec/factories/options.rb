FactoryBot.define do
  factory :option do
    name { Faker::Hipster.words(1)}
    included { Faker::Boolean.boolean }
  end
end

