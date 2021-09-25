class RecordSerializer < ActiveModel::Serializer
  attributes :id, :name, :success, :user_id, :body, :time, :date, :latitude, :longitude, :datetime, :js_date, :airTemperature, :pressure, :cloudCover, :gust, :humidity, :visibility, :windDirection, :windSpeed, :first_type, :first_time, :first_height, :second_type, :second_time, :second_height, :third_type, :third_time, :third_height, :fourth_type, :fourth_time, :fourth_height, :astronomicalDawn, :astronomicalDusk, :civilDawn, :civilDusk, :moonFraction, :moonPhase, :moonrise, :moonset, :sunrise, :sunset, :astro_time, :species

end
