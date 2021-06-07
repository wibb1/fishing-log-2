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
          data['windDirection'] =
            data['windDirection'].nil? ? 'NA' : round0(data['windDirection'])
          data['windWaveDirection'] = data['windWaveDirection'].nil? ? 'NA' 
            : round0(data['windWaveDirection'])
          data['waveDirection'] =
            data['waveDirection'].nil? ? 'NA' : round0(data['waveDirection'])

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

          speed = %w[gust windSpeed currentSpeed]

          temperature = %w[airTemperature]

          round_2_digits = %w[moonFraction]

          distance_long = %w[visibility]

          round_0_digits = %w[cloudCover windDirection windWaveDirection waveDirection]

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
binding.pry
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
            temp_hash = {'weather' => {'errors'=> hash['weather']['errors']['key']}}
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
            temp_hash = {'astro' => {'errors'=> hash['astro']['errors']['key']}}
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
            output.merge!({'tide' => {'errors' => hash['astro']['errors']['key']}})
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

          unless hash.dig('weather', 'errors') || hash.dig('astro', 'errors') || hash.dig('tide', 'errors')
            format_data(output) 
            output.transform_values! { |value| value.presence || 'NA' }
          end
          return output
        end
      end
    end
  end
end
