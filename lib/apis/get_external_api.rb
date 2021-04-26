module Apis
  module StormglassApi
    module V2
      class Client
        require 'faraday'

        attr_reader :api_key

        def initialize(api_key)
          @api_key = api_key
        end

        def faraday_request(url)
          response = Faraday.get("https://api.stormglass.io/v2/#{url}") do |req|
            req.headers["Authorization"] = @api_key
          end

          parsed_response = JSON.parse(response.body)
          response_code = response.env.status

          return parsed_response if response_successfull(response_code)
          begin
            error_message = "Code: #{response_code}, Response: #{parsed_response['message']}"
            raise StandardError.new "#{error_message}"
          rescue 
            redirect_to new_path, flash: {error: error_message}            
          end

          def response_successfull(response_code)
            response_code == 200
          end
        end
      end
    end
  end
end
