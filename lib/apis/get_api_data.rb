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
          data['cloudCover'] =
            data['cloudCover'].nil? ? 'NA' : round0(data['cloudCover'])
          data['moonFraction'] =
            data['moonFraction'].nil? ? 'NA' : round2(data['moonFraction'])
          data['visibility'] =
            data['visibility'].nil? ? 'NA' : distance_mi(data['visibility'])
          data['airTemperature'] =
            data['airTemperature'].nil? ? 'NA' : temp_F(data['airTemperature'])
          data['pressure'] =
            data['pressure'].nil? ? 'NA' : pressure_inHg(data['pressure'])
          data['gust'] = data['gust'].nil? ? 'NA' : speed_mph(data['gust'])
          data['windSpeed'] =
            data['windSpeed'].nil? ? 'NA' : speed_mph(data['windSpeed'])
          data['currentSpeed'] =
            data['currentSpeed'].nil? ? 'NA' : speed_mph(data['currentSpeed'])
          data['windDirection'] =
            data['windDirection'].nil? ? 'NA' : round0(data['windDirection'])
          data['windWaveDirection'] =
            if data['windWaveDirection'].nil?
              'NA'
            else
              round0(data['windWaveDirection'])
            end
          data['waveDirection'] =
            data['waveDirection'].nil? ? 'NA' : round0(data['waveDirection'])

          unchanged = %w[
            gust
            windSpeed
            currentSpeed
            name
            success
            body
            latitude
            longitude
            datetime
            date
            time
            js_date
            user
            pressure
            airTemperature
            visibility
            cloudCover
            moonFraction
            first_type
            second_type
            third_type
            fourth_type
            first_time
            second_time
            third_time
            fourth_time
            first_height
            second_height
            third_height
            fourth_height
          ]
          distance_short = %w[
            seaLevel
            swellHeight
            secondarySwellHeight
            waveHeight
            waveHeight
            windWaveHeight
          ]
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
          string = %w[
            humidity
            currentDirection
            swellDirection
            swellPeriod
            secondarySwellDirection
            secondarySwellPeriod
            waveDirection
            secondarySwellPeriod
            waveDirection
            wavePeriod
            windWavePeriod
          ]

          data.each_key do |key|
            if string.include?(key)
              data[key] = data[key].nil? ? 'NA' : data[key].to_s
            elsif time.include?(key)
              data[key] = data[key].nil? ? 'NA' : format_time(data[key])
            elsif distance_short.include?(key)
              data[key] = data[key].nil? ? 'NA' : distance_ft(data[key])
            end
          end
        end

        def checkdata(data, result)
          data == nil ? 'NA' : result
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
          hash = client.obtain_data #this is the raw response that needs to be checked for errors
          temp_hash =
            client.weather_request.split(',').to_h { |key| [key, nil] }
          output = {}

          temp_hash.each_key do |key|
            temp_hash[key] = hash['weather']['hours'][0][key]['sg'] if hash[
              'weather'
            ][
              'hours'
            ][
              0
            ].include?(key)
          end
          output.merge!(temp_hash)

          temp_hash = client.astro_request.split(',').to_h { |key| [key, nil] }
          temp_hash.each_key do |key|
            temp_hash[key] = hash['astro']['data'][0][key] if hash['astro'][
              'data'
            ][
              0
            ].include?(key)
          end
          temp_hash['moonPhase'] =
            hash['astro']['data'][0]['moonPhase']['closest']['text']
          output.merge!(temp_hash)

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

          format_data(output)
          output.transform_values! { |value| value.presence || 'NA' }
          return output
        end
      end
    end
  end
end
