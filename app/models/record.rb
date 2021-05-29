class Record < ApplicationRecord
  attr_accessor :latitude_direction
  attr_accessor :longitude_direction

  enum success: { good: 0, bad: 1, meh: 2 }

  validates :name, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :date, presence: true
  validates :time, presence: true
  validates :datetime, presence: true
  validates :js_date, presence: true
  validates :airTemperature, presence: true
  validates :pressure, presence: true
  validates :cloudCover, presence: true
  validates :gust, presence: true
  validates :humidity, presence: true
  validates :visibility, presence: true
  validates :windDirection, presence: true
  validates :windSpeed, presence: true
  validates :first_type, presence: true
  validates :first_time, presence: true
  validates :first_height, presence: true
  validates :second_type, presence: true
  validates :second_time, presence: true
  validates :second_height, presence: true
  validates :third_type, presence: true
  validates :third_time, presence: true
  validates :third_height, presence: true
  validates :fourth_type, presence: true
  validates :fourth_time, presence: true
  validates :fourth_height, presence: true
  validates :astronomicalDawn, presence: true
  validates :astronomicalDusk, presence: true
  validates :civilDawn, presence: true
  validates :civilDusk, presence: true
  validates :moonFraction, presence: true
  validates :moonPhase, presence: true
  validates :moonrise, presence: true
  validates :moonset, presence: true
  validates :sunrise, presence: true
  validates :sunset, presence: true
  validates :astro_time, presence: true
  validates :seaLevel, presence: true
  validates :swellDirection, presence: true
  validates :swellHeight, presence: true
  validates :swellPeriod, presence: true
  validates :secondarySwellDirection, presence: true
  validates :secondarySwellHeight, presence: true
  validates :secondarySwellPeriod, presence: true
  validates :waveDirection, presence: true
  validates :waveHeight, presence: true
  validates :wavePeriod, presence: true
  validates :windWaveDirection, presence: true
  validates :windWaveHeight, presence: true
  validates :windWavePeriod, presence: true
  validates :currentDirection, presence: true
  validates :currentSpeed, presence: true

  belongs_to :user
end
