FactoryBot.define do
  factory :species do
    common_name { Faker::Name.first_name }
    scientific_name { Faker::Name.last_name }
    shallow_depth { Faker::Number.number(digits: 2) }
    deep_depth { Faker::Number.number(digits: 2) }
  end
end