module Apis
  module StormglassApi
    module V2
      class GetApiData
        require './lib/apis/get_external_api.rb'
        require 'date'

        attr_reader :parsed_time, :lat, :lng

        def initialize(parsed_time, lat, lng)
          @parsed_time = parsed_time
          @lat = lat
          @lng = lng
        end

        def format_data(data)
          
          distance_short = %w[
            seaLevel
            swellHeight
            secondarySwellHeight
            waveHeight
            windWaveHeight
          ]
          
          distance_short.each do |short|
            data[short] = data[short].nil? ? 'NA' : distance_ft(data[short])
          end

          time = %w[
            astronomicalDawn
            astronomicalDusk
            civilDawn
            civilDusk
            moonrise
            moonset
            sunrise
            sunset
            time
          ]
          time.each do |time|
            data[time] = data[time].nil? ? 'NA' : format_time(data[time])
          end

          string = %w[
            cloudCover
            humidity
            currentDirection
            swellDirection
            swellPeriod
            secondarySwellDirection
            secondarySwellPeriod
            waveDirection
            wavePeriod
            windDirection
            windWavePeriod
            windWaveDirection
          ]
          string.each do |string|
            data[string] = data[string].nil? ? 'NA' : data[string].to_s
          end

          speed = %w[gust windSpeed currentSpeed]
          speed.each do |speed|
            data[speed] = data[speed].nil? ? 'NA' : speed_mph(data[speed])
          end

          distance_long = %w[visibility]
          distance_long.each do |long|
            data[long] = data[long].nil? ? 'NA' : distance_mi(data[long])
          end

          temperature = %w[airTemperature]
          temperature.each do |temp|
            data[temp] = data[temp].nil? ? 'NA' : temp_F(data[temp])
          end

          round_2_digits = %w[moonFraction]
          round_2_digits.each do |round|
            data[round] = data[round].nil? ? 'NA' : round2(data[round])
          end

          pressure = %w[pressure]
          pressure.each do |pressure|
            data[pressure] =
              data[pressure].nil? ? 'NA' : pressure_inHg(data[pressure])
          end
        end

        def distance_mi(km)
          round0(km * 0.621371)
        end

        def distance_ft(meter)
          round2(meter * 3.28)
        end

        def speed_mph(mps)
          round2(mps * 2.237)
        end

        def temp_F(deg_c)
          round0(deg_c * 9 / 5 + 32)
        end

        def pressure_inHg(pHa)
          round2(pHa * 0.03)
        end

        def format_time(value)
          DateTime
            .strptime(value, '%Y-%m-%dT%H:%M:%S%z')
            .localtime
            .strftime('%m-%d-%Y %H:%M')
        end

        def round0(value)
          value.round(0).to_s
        end

        def round2(value)
          value.round(2).to_s
        end

        def get_api_data
          client = Apis::StormglassApi::V2::Client.new(@parsed_time, @lat, @lng)
          hash = client.obtain_data
          output = {}

          #weather
          temp_hash =
            client.weather_request.split(',').to_h { |key| [key, nil] }
          if hash.dig('weather', 'errors')
            temp_hash = {
              'weather' => {
                'errors' => hash['weather']['errors']['key'],
              },
            }
          else
            temp_hash.each_key do |key|
              if hash['weather']['hours'][0].include?(key)
                temp_hash[key] = hash['weather']['hours'][0][key]['sg']
              end
            end
          end
          output.merge!(temp_hash)

          #astro
          temp_hash = client.astro_request.split(',').to_h { |key| [key, nil] }
          if hash.dig('astro', 'errors')
            temp_hash = {
              'astro' => {
                'errors' => hash['astro']['errors']['key'],
              },
            }
          else
            temp_hash.each_key do |key|
              if hash['astro']['data'][0].include?(key)
                temp_hash[key] = hash['astro']['data'][0][key]
              end
            end
            temp_hash['moonPhase'] =
              hash['astro']['data'][0]['moonPhase']['closest']['text']
          end
          output.merge!(temp_hash)

          #tide
          if hash.dig('tide', 'errors')
            output.merge!(
              { 'tide' => { 'errors' => hash['astro']['errors']['key'] } },
            )
          else
            i = 0
            tide_data = hash['tide']['data']
            %w[first second third fourth].each do |j|
              if tide_data[i]
                output["#{j}_type"] = tide_data[i]['type']
                output["#{j}_time"] = format_time(tide_data[i]['time'])
                output["#{j}_height"] = round2(tide_data[i]['height'])
                i += 1
              end
            end
          end

          unless hash.dig('weather', 'errors') || hash.dig('astro', 'errors') ||
                   hash.dig('tide', 'errors')
            format_data(output)
            output.transform_values! { |value| value.presence || 'NA' }
          end
          return output
        end
      end
    end
  end
end
