class RecordsController < ApplicationController
require 'date'
require 'faraday'

  def new
    @record_new = Record.new()
    @record_new.user = current_user
  end

  def create
    time = Time.local(create_params["datetime(1i)"], create_params["datetime(2i)"], create_params["datetime(3i)"], create_params["datetime(4i)"], create_params["datetime(5i)"])

    @record_new = Record.new()
    @record_new.name = create_params["name"]
    @record_new.success = create_params["success"]
    @record_new.body = create_params["body"]
    @record_new.latitude = create_params["latitude"]
    @record_new.longitude = create_params["longitude"]
    @record_new.datetime = time
    @record_new.date = time.strftime("%Y-%m-%dT%H:%M:%S%z")
    @record_new.time = time.strftime("%H:%M")
    @record_new.js_date = time.to_f * 1000
    @record_new.user = current_user

    puts "--------------------"
    puts @record_new.name
    puts @record_new.success
    puts @record_new.body
    puts @record_new.latitude
    puts @record_new.longitude
    puts @record_new.datetime.inspect
    puts @record_new.date
    puts @record_new.time
    puts @record_new.js_date
    puts "--------------------"

    ####################################  

    parsed_time = Time.parse(@record_new.date)
    start_time = parsed_time.getutc.to_s
    end_DateTime_hour = parsed_time.advance(hours: 1).getutc.to_s
    end_DateTime_day = parsed_time.advance(days: 1).getutc.to_s
    start_day = parsed_time.beginning_of_day.getutc.to_s
    end_day = parsed_time.end_of_day.getutc.to_s
    puts "--------------------"
    puts start_time
    puts end_DateTime_hour
    puts start_day
    puts end_day
    puts "--------------------"

    ####################################

    create_weather(start_time, end_DateTime_hour)
    create_tide(start_day, end_day)
    create_astro(start_day, end_day)
    create_waves(start_time, end_DateTime_hour)

    if @record_new.save
      flash[:notice] = "Record successfully saved"
      puts "*****Record sucessfully saved*****"
      redirect_to "/records/react/#{@record_new.id}"
    else
      flash[:errors] = @record_new.errors.full_messages.to_sentence
      puts "-----#{@record_new.errors.full_messages.to_sentence}-----"
      render 'new'
    end
  end

  ####################################

  def create_weather(start_time, end_DateTime_hour)
    weather_request = 'airTemperature,pressure,cloudCover,currentDirection,currentSpeed,gust,humidity,seaLevel,visibility,windDirection,windSpeed'

    weather_url = "weather/point?lat=#{@record_new.latitude}&lng=#{@record_new.longitude}&start=#{start_time}&end=#{end_DateTime_hour}&source=#{"sg"}&params=#{weather_request}"
    parsed_response = faraday_request(weather_url)
binding.pry
    data = parsed_response["hours"][0]

    @record_new.airTemperature = ((data["airTemperature"]["sg"])*9/5+32).round(0).to_s
    @record_new.pressure = (data["pressure"]["sg"]*0.03).round(2).to_s
    @record_new.cloudCover = (data["cloudCover"]["sg"]).round(2).to_s
    @record_new.gust = (data["gust"]["sg"]*2.237).round(2).to_s
    @record_new.humidity = data["humidity"]["sg"].to_s
    @record_new.visibility = ((data["visibility"]["sg"])*0.621371).round(2).to_s
    @record_new.windDirection = data["windDirection"]["sg"].to_s
    @record_new.windSpeed = (data["windSpeed"]["sg"]*2.237).round(2).to_s
    @record_new.currentDirection = data["currentDirection"]["sg"].to_s
    @record_new.currentSpeed = (data["currentSpeed"]["sg"]*2.237).round(2).to_s

    puts "--------------------"
    puts "Air Temperature: #{@record_new.airTemperature}"
    puts "pressure: #{@record_new.pressure}"
    puts "cloudCover: #{@record_new.cloudCover}"
    puts "gust: #{@record_new.gust}"
    puts "humidity: #{@record_new.humidity}"
    puts "visibility: #{@record_new.visibility}"
    puts "windDirection: #{@record_new.windDirection}"
    puts "windSpeed: #{@record_new.windSpeed}"
    puts "currentDirection: #{@record_new.currentDirection}"
    puts "currentSpeed: #{@record_new.currentSpeed}"
    puts "--------------------"

  end

  ####################################

  def create_tide(start_time, end_DateTime_day)
    tide_url="tide/extremes/point?lat=#{@record_new.latitude}&lng=#{@record_new.longitude}&start=#{start_time}&end=#{end_DateTime_day}"
    parsed_response = faraday_request(tide_url)
    tide_data = parsed_response["data"]
    @record_new.first_type = tide_data[0]["type"]
    @record_new.first_height = (tide_data[0]["height"]*3.28).round(2).to_s
    @record_new.first_time = (DateTime.strptime(tide_data[0]["time"], "%Y-%m-%dT%H:%M:%S%z").localtime).strftime("%m-%d-%Y %H:%M")
    @record_new.second_type = tide_data[1]["type"]
    @record_new.second_time = (DateTime.strptime(tide_data[1]["time"], "%Y-%m-%dT%H:%M:%S%z").localtime).strftime("%m-%d-%Y %H:%M")
    @record_new.second_height = (tide_data[1]["height"]*3.28).round(2).to_s
    @record_new.third_type = tide_data[2]["type"]
    @record_new.third_time = (DateTime.strptime(tide_data[2]["time"], "%Y-%m-%dT%H:%M:%S%z").localtime).strftime("%m-%d-%Y %H:%M")
    @record_new.third_height = (tide_data[2]["height"]*3.28).round(2).to_s

    if tide_data[3]
      @record_new.fourth_type = tide_data[3]["type"]
      @record_new.fourth_time = (DateTime.strptime(tide_data[3]["time"], "%Y-%m-%dT%H:%M:%S%z").localtime).strftime("%m-%d-%Y %H:%M")
      @record_new.fourth_height = (tide_data[3]["height"]*3.28).round(2).to_s
    else
      @record_new.fourth_type = "NA"
      @record_new.fourth_time = "NA"
      @record_new.fourth_height = "NA"
    end
    puts "--------------------"
    puts "#{@record_new.first_type}  #{@record_new.first_height}  #{@record_new.first_time}"
    puts "#{@record_new.second_type}  #{@record_new.second_height}  #{@record_new.second_time}"
    puts "#{@record_new.third_type}  #{@record_new.third_height}  #{@record_new.third_time}"
    puts "#{@record_new.fourth_type}  #{@record_new.fourth_height}  #{@record_new.fourth_time}"
    puts "--------------------"
  end

  ####################################

  def create_astro(start_time, end_DateTime_day)
    astro_request = "astronomicalDawn,astronomicalDusk,civilDawn,civilDusk,moonFraction,moonPhase,moonrise,moonset,sunrise,sunset,time"
    astro_url="astronomy/point?lat=#{@record_new.latitude}&lng=#{@record_new.longitude}&start=#{start_time}&end=#{end_DateTime_day}&params=#{astro_request}"
    parsed_response = faraday_request(astro_url)
    astro_data = parsed_response["data"]

    @record_new.astronomicalDawn = (DateTime.strptime(astro_data[0]["astronomicalDawn"], "%Y-%m-%dT%H:%M:%S%z").localtime).strftime("%m-%d-%Y %H:%M")
    @record_new.astronomicalDusk = (DateTime.strptime(astro_data[0]["astronomicalDusk"], "%Y-%m-%dT%H:%M:%S%z").localtime).strftime("%m-%d-%Y %H:%M")
    @record_new.civilDawn = (DateTime.strptime(astro_data[0]["civilDawn"], "%Y-%m-%dT%H:%M:%S%z").localtime).strftime("%m-%d-%Y %H:%M")
    @record_new.civilDusk = (DateTime.strptime(astro_data[0]["civilDusk"], "%Y-%m-%dT%H:%M:%S%z").localtime).strftime("%m-%d-%Y %H:%M")
    @record_new.moonFraction = (astro_data[0]["moonFraction"]).round(2).to_s
    @record_new.moonPhase = astro_data[0]["moonPhase"]["closest"]["text"].to_s
    @record_new.moonrise = (DateTime.strptime(astro_data[0]["moonrise"], "%Y-%m-%dT%H:%M:%S%z").localtime).strftime("%m-%d-%Y %H:%M")
    @record_new.moonset = (DateTime.strptime(astro_data[0]["moonset"], "%Y-%m-%dT%H:%M:%S%z").localtime).strftime("%m-%d-%Y %H:%M")
    @record_new.sunrise = (DateTime.strptime(astro_data[0]["sunrise"], "%Y-%m-%dT%H:%M:%S%z").localtime).strftime("%m-%d-%Y %H:%M")
    @record_new.sunset = (DateTime.strptime(astro_data[0]["sunset"], "%Y-%m-%dT%H:%M:%S%z").localtime).strftime("%m-%d-%Y %H:%M")
    @record_new.astro_time = (DateTime.strptime(astro_data[0]["time"], "%Y-%m-%dT%H:%M:%S%z").localtime).strftime("%m-%d-%Y %H:%M")
    puts "--------------------"
    puts "First Light #{@record_new.astronomicalDawn}"
    puts "Last Light #{@record_new.astronomicalDusk}"
    puts "Civil Dawn #{@record_new.civilDawn}"
    puts "Civil Dusk #{@record_new.civilDusk}"
    puts "Moon Fraction #{@record_new.moonFraction}"
    puts "Moon Phase #{@record_new.moonPhase}"
    puts "Moon Rise #{@record_new.moonrise}"
    puts "Moon Set #{@record_new.moonset}"
    puts "Sunrise #{@record_new.sunrise}"
    puts "Sunset #{@record_new.sunset}"
    puts "Time #{@record_new.time}"
    puts "--------------------"
  end

  ####################################

  def create_waves(start_date, end_DateTime_day)
    wave_request = 'seaLevel,swellDirection,swellHeight,swellPeriod,secondarySwellDirection,secondarySwellHeight,secondarySwellPeriod,waveDirection,waveHeight,wavePeriod,windWaveDirection,windWaveHeight,windWavePeriod'

    wave_url = "weather/point?lat=#{@record_new.latitude}&lng=#{@record_new.longitude}&start=#{start_date}&end=#{end_DateTime_day}&params=#{wave_request}"
    parsed_response = faraday_request(wave_url)
    data = parsed_response["hours"][0]
    
    @record_new.seaLevel=(data["seaLevel"]["sg"]*3.28).round(2).to_s
    @record_new.swellDirection=data["swellDirection"]["sg"].to_s
    @record_new.swellHeight=(data["swellHeight"]["sg"]*3.28).round(2).to_s
    @record_new.swellPeriod=data["swellPeriod"]["sg"].to_s
    @record_new.secondarySwellDirection=data["secondarySwellDirection"]["sg"].to_s
    @record_new.secondarySwellHeight=(data["secondarySwellHeight"]["sg"]*3.28).round(2).to_s
    @record_new.secondarySwellPeriod=data["secondarySwellPeriod"]["sg"].to_s
    @record_new.waveDirection=data["waveDirection"]["sg"].to_s
    @record_new.waveHeight=(data["waveHeight"]["sg"]*3.28).round(2).to_s
    @record_new.wavePeriod=data["wavePeriod"]["sg"].to_s
    @record_new.windWaveDirection=data["windWaveDirection"]["sg"].to_s
    @record_new.windWaveHeight=(data["windWaveHeight"]["sg"]*3.28).round(2).to_s
    @record_new.windWavePeriod=(data["windWavePeriod"]["sg"]*3.28).round(2).to_s

    puts "--------------------"
    puts "seaLevel #{@record_new.seaLevel}"
    puts "swellDirection #{@record_new.swellDirection}"
    puts "swellHeight #{@record_new.swellHeight}"
    puts "swellPeriod #{@record_new.swellPeriod}"
    puts "secondarySwellDirection #{@record_new.secondarySwellDirection}"
    puts "secondarySwellHeight #{@record_new.secondarySwellHeight}"
    puts "secondarySwellPeriod #{@record_new.secondarySwellPeriod}"
    puts "waveDirection #{@record_new.waveDirection}"
    puts "waveHeight #{@record_new.waveHeight}"
    puts "wavePeriod #{@record_new.wavePeriod}"
    puts "windWaveDirection #{@record_new.windWaveDirection}"
    puts "windWaveHeight #{@record_new.windWaveHeight}"
    puts "windWavePeriod #{@record_new.windWavePeriod}"
    puts "--------------------"
  end

  ####################################

  def faraday_request(url)
    api_key = ENV['STORMGLASS_API_KEY']

    response = Faraday.get("https://api.stormglass.io/v2/#{url}") do |req|
      req.headers["Authorization"] = api_key
    end
    parsed_response = JSON.parse(response.body)
    return parsed_response
  end

  private

  def create_params
    params.require(:record).permit(:name, :success, :body, :latitude, :longitude, :datetime)
  end
end