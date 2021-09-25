FactoryBot.define do
  factory :record do
    name { Faker::Movie.title }
    success { 'good' }
    body { Faker::Movie.quote }
    latitude {41.8}
    longitude {-70.8}
    date {Date.today().to_s}
    time {Time.now().advance(hour: -1).to_s}
    datetime {Time.now().advance(hour: -1)}
    js_date {((Time.now().advance(hour: -1).to_f) * 1000)}
  end
end