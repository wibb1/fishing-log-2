require 'factory_bot'

FactoryBot.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    first_name { 'first_name' }
    last_name { 'last_name' }
    sequence(:user_name) { |n| "user_name#{n}" }
    password { 'password' }
    password_confirmation { 'password' }
  end
end

  FactoryBot.define do
    factory :record do
      sequence(:name) { |n| "record#{n}" }
      success {'success'}
      species {'species'}
      body {'body'}
      latitude {41.8}
      longitude {-70.8}
    end
end
