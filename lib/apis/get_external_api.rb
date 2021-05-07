module Apis
  module StormglassApi
    module V2
      class Client
        require 'faraday'
        require 'date'
        attr_reader :api_key

        def initialize(api_key, parsed_time, lat, lng)
          @api_key = api_key
          @parsed_time = parsed_time
          @lat = lat
          @lng = lng
        end

        def create_data(request, parsed_time, lat, lng)

        end

        def faraday_request(url)
          response = Faraday.get("https://api.stormglass.io/v2/#{url}") do |req|
            req.headers["Authorization"] = @api_key
          end
          puts "https://api.stormglass.io/v2/#{url}"
          parsed_response = JSON.parse(response.body)
          puts "API Parsed Response"
          puts parsed_response
          return parsed_response
        end

        def create_url(request)
          if request == "weather"
            weather_request = 'airTemperature,pressure,cloudCover,currentDirection,currentSpeed,gust,humidity,seaLevel,visibility,windDirection,windSpeed'
            url = "weather/point?lat=#{@lat}&lng=#{@lng}&start=#{get_start_hour()}&end=#{get_end_hour()}&source=#{"sg"}&params=#{weather_request}"

          elsif request == 'wave' 
            wave_request = 'seaLevel,swellDirection,swellHeight,swellPeriod,secondarySwellDirection,secondarySwellHeight,secondarySwellPeriod,waveDirection,waveHeight,wavePeriod,windWaveDirection,windWaveHeight,windWavePeriod'
            url = "weather/point?lat=#{@lat}&lng=#{@lng}&start=#{get_start_day()}&end=#{get_end_day()}&params=#{wave_request}"

          elsif request == "tide"
            url="tide/extremes/point?lat=#{@lat}&lng=#{@lng}&start=#{get_start_day()}&end=#{get_end_day()}"

          elsif request == "astro"
            astro_request = "astronomicalDawn,astronomicalDusk,civilDawn,civilDusk,moonFraction,moonPhase,moonrise,moonset,sunrise,sunset,time"
            url="astronomy/point?lat=#{@lat}&lng=#{@lng}&start=#{get_start_day()}&end=#{get_end_day()}&params=#{astro_request}"

          else
            url = "error in request"
          end

          return url
        end

        def get_start_hour()
          start_time = @parsed_time.getutc.to_s
        end

        def get_end_hour()
          end_DateTime_hour = @parsed_time.advance(hours: 1).getutc.to_s
        end

        def get_start_day()
          start_day = @parsed_time.beginning_of_day.getutc.to_s
        end

        def get_end_day()
          end_DateTime_day = @parsed_time.advance(days: 1).getutc.to_s
        end

      end
    end
  end
end
