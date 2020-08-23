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

    @record_new = Record.new(name: @record_new.name, success: @record_new.success, body: @record_new.body, latitude: @record_new.latitude, longitude: @record_new.longitude, datetime: @record_new.datetime, date: @record_new.date, time: @record_new.time, js_date: @record_new.js_date, user: @record_new.user)

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


    weather_url = "weather/point?lat=#{@record_new.latitude}&lng=#{@record_new.longitude}&start=#{start_time}&end=#{end_DateTime_hour}&source=#{"noaa"}&params=#{weather_request}"
    parsed_response = faraday_request(weather_url)

    data = parsed_response["hours"][0]

    airTemperature = ((data["airTemperature"]["noaa"])*9/5+32).round(0).to_s
    pressure = (data["pressure"]["noaa"]*0.03).round(2).to_s
    cloudCover = (data["cloudCover"]["noaa"]).round(2).to_s
    gust = (data["gust"]["noaa"]*2.237).round(2).to_s
    humidity = data["humidity"]["noaa"].to_s
    visibility = ((data["visibility"]["noaa"])*0.621371).round(2).to_s
    windDirection = data["windDirection"]["noaa"].to_s
    windSpeed = (data["windSpeed"]["noaa"]*2.237).round(2).to_s

    puts "--------------------"
    puts "Air Temperature: #{airTemperature}"
    puts "pressure: #{pressure}"
    puts "cloudCover: #{cloudCover}"
    puts "gust: #{gust}"
    puts "humidity: #{humidity}"
    puts "visibility: #{visibility}"
    puts "windDirection: #{windDirection}"
    puts "windSpeed: #{windSpeed}"
    puts "--------------------"
  end

  ####################################

  def create_tide(start_time, end_DateTime_day)
    tide_url="tide/extremes/point?lat=#{@record_new.latitude}&lng=#{@record_new.longitude}&start=#{start_time}&end=#{end_DateTime_day}"
    parsed_response = faraday_request(tide_url)
    tide_data = parsed_response["data"]
    first_type = tide_data[0]["type"]
    first_height = (tide_data[0]["height"]*3.28).round(2).to_s
    first_time = (DateTime.strptime(tide_data[0]["time"], "%Y-%m-%dT%H:%M:%S%z").localtime).strftime("%m-%d-%Y %H:%M")
    second_type = tide_data[1]["type"]
    second_time = (DateTime.strptime(tide_data[1]["time"], "%Y-%m-%dT%H:%M:%S%z").localtime).strftime("%m-%d-%Y %H:%M")
    second_height = (tide_data[1]["height"]*3.28).round(2).to_s
    third_type = tide_data[2]["type"]
    third_time = (DateTime.strptime(tide_data[2]["time"], "%Y-%m-%dT%H:%M:%S%z").localtime).strftime("%m-%d-%Y %H:%M")
    third_height = (tide_data[2]["height"]*3.28).round(2).to_s

    if tide_data[3]
      fourth_type = tide_data[3]["type"]
      fourth_time = (DateTime.strptime(tide_data[3]["time"], "%Y-%m-%dT%H:%M:%S%z").localtime).strftime("%m-%d-%Y %H:%M")
      fourth_height = (tide_data[3]["height"]*3.28).round(2).to_s
    else
      fourth_type = "NA"
      fourth_time = "NA"
      fourth_height = "NA"
    end
    puts "--------------------"
    puts "#{first_type}  #{first_height}  #{first_time}"
    puts "#{second_type}  #{second_height}  #{second_time}"
    puts "#{third_type}  #{third_height}  #{third_time}"
    if tide_data[3]
      puts "#{fourth_type}  #{fourth_height}  #{fourth_time}"
    end
    puts "--------------------"
  end

  ####################################

  def create_astro(start_time, end_DateTime_day)
    astro_request = "astronomicalDawn,astronomicalDusk,civilDawn,civilDusk,moonFraction,moonPhase,moonrise,moonset,sunrise,sunset,time"

    astro_url="astronomy/point?lat=#{@record_new.latitude}&lng=#{@record_new.longitude}&start=#{start_time}&end=#{end_DateTime_day}&params=#{astro_request}"
    parsed_response = faraday_request(astro_url)
    astro_data = parsed_response["data"]
    binding.pry

    astronomicalDawn = (DateTime.strptime(astro_data[0]["astronomicalDawn"], "%Y-%m-%dT%H:%M:%S%z").localtime).strftime("%m-%d-%Y %H:%M")
    astronomicalDusk = (DateTime.strptime(astro_data[0]["astronomicalDusk"], "%Y-%m-%dT%H:%M:%S%z").localtime).strftime("%m-%d-%Y %H:%M")
    civilDawn = (DateTime.strptime(astro_data[0]["civilDawn"], "%Y-%m-%dT%H:%M:%S%z").localtime).strftime("%m-%d-%Y %H:%M")
    civilDusk = (DateTime.strptime(astro_data[0]["civilDusk"], "%Y-%m-%dT%H:%M:%S%z").localtime).strftime("%m-%d-%Y %H:%M")
    moonFraction = (astro_data[0]["moonFraction"]).round(2).to_s
    moonPhase = astro_data[0]["moonPhase"]["closest"]["text"].to_s
    moonrise = (DateTime.strptime(astro_data[0]["moonrise"], "%Y-%m-%dT%H:%M:%S%z").localtime).strftime("%m-%d-%Y %H:%M")
    moonset = (DateTime.strptime(astro_data[0]["moonset"], "%Y-%m-%dT%H:%M:%S%z").localtime).strftime("%m-%d-%Y %H:%M")
    sunrise = (DateTime.strptime(astro_data[0]["sunrise"], "%Y-%m-%dT%H:%M:%S%z").localtime).strftime("%m-%d-%Y %H:%M")
    sunset = (DateTime.strptime(astro_data[0]["sunset"], "%Y-%m-%dT%H:%M:%S%z").localtime).strftime("%m-%d-%Y %H:%M")
    time = (DateTime.strptime(astro_data[0]["time"], "%Y-%m-%dT%H:%M:%S%z").localtime).strftime("%m-%d-%Y %H:%M")
    puts "--------------------"
    puts "First Light #{astronomicalDawn}"
    puts "Last Light #{astronomicalDusk}"
    puts "Civil Dawn #{civilDawn}"
    puts "Civil Dusk #{civilDusk}"
    puts "Moon Fraction #{moonFraction}"
    puts "Moon Phase #{moonPhase}"
    puts "Moon Rise #{moonrise}"
    puts "Moon Set #{moonset}"
    puts "Sunrise #{sunrise}"
    puts "Sunset #{sunset}"
    puts "Time #{time}"
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