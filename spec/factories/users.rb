
FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "email#{n}@example.com" }
    first_name { Faker::Name::first_name }
    last_name { Faker::Name.last_name }
    sequence(:user_name) { |n| "user_name#{n}" }
    password { 'password' }
    password_confirmation { 'password' }
  end
end  