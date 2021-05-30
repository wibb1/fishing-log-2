class Record < ApplicationRecord
  attr_accessor :latitude_direction
  attr_accessor :longitude_direction

  enum success: { good: 0, bad: 1, meh: 2 }

  validates_presence_of :name, :latitude, :longitude, :date, :time, :datetime, :js_date, :airTemperature, :pressure, :cloudCover, :gust, :humidity, :visibility, :windDirection, :windSpeed, :first_type, :first_time, :first_height, :second_type, :second_time, :second_height, :third_type, :third_time, :third_height, :fourth_type, :fourth_time, :fourth_height, :astronomicalDawn, :astronomicalDusk, :civilDawn, :civilDusk, :moonFraction, :moonPhase, :moonrise, :moonset, :sunrise, :sunset, :astro_time, :seaLevel, :swellDirection, :swellHeight, :swellPeriod, :secondarySwellDirection, :secondarySwellHeight, :secondarySwellPeriod, :waveDirection, :waveHeight, :wavePeriod, :windWaveDirection, :windWaveHeight, :windWavePeriod, :currentDirection, :currentSpeed

  belongs_to :user
end
