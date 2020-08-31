class AddApiColumnsToRecord < ActiveRecord::Migration[5.2]
  def change
    add_column :records, :airTemperature, :text, default: "NA"
    add_column :records, :pressure, :text, default: "NA"
    add_column :records, :cloudCover, :text, default: "NA"
    add_column :records, :gust, :text, default: "NA"
    add_column :records, :humidity, :text, default: "NA"
    add_column :records, :visibility, :text, default: "NA"
    add_column :records, :windDirection, :text, default: "NA"
    add_column :records, :windSpeed, :text, default: "NA"
    add_column :records, :currentDirection, :text, default: "NA"
    add_column :records, :currentSpeed, :text, default: "NA"
    add_column :records, :first_type, :text, default: "NA"
    add_column :records, :first_time, :text, default: "NA"
    add_column :records, :first_height, :text, default: "NA"
    add_column :records, :second_type, :text, default: "NA"
    add_column :records, :second_time, :text, default: "NA"
    add_column :records, :second_height, :text, default: "NA"
    add_column :records, :third_type, :text, default: "NA"
    add_column :records, :third_time, :text, default: "NA"
    add_column :records, :third_height, :text, default: "NA"
    add_column :records, :fourth_type, :text, default: "NA"
    add_column :records, :fourth_time, :text, default: "NA"
    add_column :records, :fourth_height, :text, default: "NA"
    add_column :records, :astronomicalDawn, :text, default: "NA"
    add_column :records, :astronomicalDusk, :text, default: "NA"
    add_column :records, :civilDawn, :text, default: "NA"
    add_column :records, :civilDusk, :text, default: "NA"
    add_column :records, :moonFraction, :text, default: "NA"
    add_column :records, :moonPhase, :text, default: "NA"
    add_column :records, :moonrise, :text, default: "NA"
    add_column :records, :moonset, :text, default: "NA"
    add_column :records, :sunrise, :text, default: "NA"
    add_column :records, :sunset, :text, default: "NA"
    add_column :records, :astro_time, :text, default: "NA"
    add_column :records, :seaLevel, :text, default: "NA"
    add_column :records, :swellDirection, :text, default: "NA"
    add_column :records, :swellHeight, :text, default: "NA"
    add_column :records, :swellPeriod, :text, default: "NA"
    add_column :records, :secondarySwellDirection, :text, default: "NA"
    add_column :records, :secondarySwellHeight, :text, default: "NA"
    add_column :records, :secondarySwellPeriod, :text, default: "NA"
    add_column :records, :waveDirection, :text, default: "NA"
    add_column :records, :waveHeight, :text, default: "NA"
    add_column :records, :wavePeriod, :text, default: "NA"
    add_column :records, :windWaveDirection, :text, default: "NA"
    add_column :records, :windWaveHeight, :text, default: "NA"
    add_column :records, :windWavePeriod, :text, default: "NA"
  end
end