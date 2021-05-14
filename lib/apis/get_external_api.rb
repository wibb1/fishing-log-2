module Apis
  module StormglassApi
    module V2
      class Client
        require 'faraday'
        require 'date'

        attr_reader :parsed_time,
                    :lat,
                    :lng,
                    :weather_request,
                    :astro_request,
                    :tide_request

        def initialize(parsed_time, lat, lng)
          @parsed_time = parsed_time
          @lat = lat
          @lng = lng
          @weather_request =
            'airTemperature,pressure,cloudCover,currentDirection,currentSpeed,gust,humidity,seaLevel,visibility,windDirection,windSpeed,seaLevel,swellDirection,swellHeight,swellPeriod,secondarySwellDirection,secondarySwellHeight,secondarySwellPeriod,waveDirection,waveHeight,wavePeriod,windWaveDirection,windWaveHeight,windWavePeriod'
          @astro_request =
            'astronomicalDawn,astronomicalDusk,civilDawn,civilDusk,moonFraction,moonPhase,moonrise,moonset,sunrise,sunset,time'
          @tide_request =
            'first_type,first_height,first_time,second_type,second_height,second_type,third_type,third_time,third_height,fourth_type,fourth_time,fourth_height'
        end

        def obtain_data()
          hash = {}
          %w[weather tide astro].each do |request|
            hash[request] = faraday_request(create_url(request)) #this takes the existing responses and compiles them into a single hash
          end

          return hash
        end

        def faraday_request(url)
          response =
            Faraday.get("https://api.stormglass.io/v2/#{url}") do |req|
              req.headers['Authorization'] = ENV.fetch('STORMGLASS_API_KEY')
            end

          parsed_response = JSON.parse(response.body)

          return response_successfull?(parsed_response)
        end

        def create_url(request)
          if request == 'weather'
            url =
              "weather/point?lat=#{@lat}&lng=#{@lng}&start=#{get_start_hour}&end=#{get_end_hour}&source=#{'sg'}&params=#{@weather_request}"
          elsif request == 'tide'
            url =
              "tide/extremes/point?lat=#{@lat}&lng=#{@lng}&start=#{get_start_day}&end=#{get_end_day}"
          elsif request == 'astro'
            url =
              "astronomy/point?lat=#{@lat}&lng=#{@lng}&start=#{get_start_day}&end=#{get_end_day}&params=#{@astro_request}"
          else
            url = "Error:_Unknown_URL=see_'get_external_api.rb'_'create_url'"
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

        # *******************************************************************
        # need to reinstitute error checking
        def response_successfull?(parsed_response)
          return parsed_response if parsed_response.exclude?('error')
          begin
            error_message =
              "Errors: #{parsed_response['errors']}, Response: #{parsed_response}"
            raise StandardError.new "#{parsed_response}"
          rescue StandardError
            redirect_to root_path, flash: { error: error_message }
          end
        end
        # *******************************************************************
      end
    end
  end
end
