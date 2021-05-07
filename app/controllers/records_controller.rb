class RecordsController < ApplicationController
require 'date'
require 'faraday'
require './lib/apis/get_external_api.rb'

  def new
    @record_new = Record.new()
    @record_new.user = current_user
  end

  def edit 
    @record = Record.find(params[:id])
  end

  def update
    @record = Record.find(params[:id])
    if @record.update(update_params)
      redirect_to "/records/react/#{@record.id}"
    else
      render 'edit'
    end
  end

  def destroy
    Record.destroy(params[:id])
    redirect_to '/records/react'
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
    ################Future helper################
    parsed_time = Time.parse(@record_new.date)
    # start_time = parsed_time.getutc.to_s
    # end_DateTime_hour = parsed_time.advance(hours: 1).getutc.to_s
    # end_DateTime_day = parsed_time.advance(days: 1).getutc.to_s
    # start_day = parsed_time.beginning_of_day.getutc.to_s
    # end_day = parsed_time.end_of_day.getutc.to_s
    
    stormglass_client = Apis::StormglassApi::V2::Client.new(ENV['STORMGLASS_API_KEY'])
    # create_weather(stormglass_client, start_time, end_DateTime_hour)
    # create_tide(stormglass_client, start_day, end_day)
    # create_astro(stormglass_client, start_day, end_day)
    # create_waves(stormglass_client, start_time, end_DateTime_hour)
    create_weather(stormglass_client, parsed_time)
    create_tide(stormglass_client, parsed_time)
    create_astro(stormglass_client, parsed_time)
    create_waves(stormglass_client, parsed_time)
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
    ################Future PORO################
  def create_weather(stormglass_client, parsed_time)
    # weather_request = 'airTemperature,pressure,cloudCover,currentDirection,currentSpeed,gust,humidity,seaLevel,visibility,windDirection,windSpeed'
    # weather_url = "weather/point?lat=#{@record_new.latitude}&lng=#{@record_new.longitude}&start=#{start_time}&end=#{end_DateTime_hour}&source=#{"sg"}&params=#{weather_request}"
    weather_url = stormglass_client.create_url("weather", parsed_time, @record_new.latitude, @record_new.longitude)

    parsed_response = stormglass_client.faraday_request(weather_url)
    data = parsed_response["hours"][0]

    @record_new.airTemperature = ((data["airTemperature"]["sg"])*9/5+32).round(0).to_s
    @record_new.pressure = (data["pressure"]["sg"]*0.03).round(2).to_s
    @record_new.cloudCover = (data["cloudCover"]["sg"]).round(2).to_s
    @record_new.gust = mps_to_mph(data["gust"]["sg"])
    @record_new.humidity = data["humidity"]["sg"].to_s
    @record_new.visibility = ((data["visibility"]["sg"])*0.621371).round(2).to_s
    @record_new.windDirection = data["windDirection"]["sg"].to_s
    @record_new.windSpeed = mps_to_mph(data["windSpeed"]["sg"])
    #binding.pry
    if(data.include?("current"))
      @record_new.currentDirection = data["currentDirection"]["sg"].to_s
      @record_new.currentSpeed = mps_to_mph(data["currentSpeed"]["sg"])
    else
      @record_new.currentDirection = "NA"
      @record_new.currentSpeed = 0
    end
  end
    ################Future PORO################
  def create_tide(stormglass_client, parsed_time)
    # tide_url="tide/extremes/point?lat=#{@record_new.latitude}&lng=#{@record_new.longitude}&start=#{start_time}&end=#{end_DateTime_day}"
    tide_url = stormglass_client.create_url("tide", parsed_time, @record_new.latitude, @record_new.longitude)
    parsed_response = stormglass_client.faraday_request(tide_url)
    response_successfull?(parsed_response)


    tide_data = parsed_response["data"]
    @record_new.first_type = tide_data[0]["type"]
    @record_new.first_height = m_to_ft(tide_data[0]["height"])
    @record_new.first_time = format_time(tide_data[0]["time"])
    @record_new.second_type = tide_data[1]["type"]
    @record_new.second_time = format_time(tide_data[1]["time"])
    @record_new.second_height = m_to_ft(tide_data[1]["height"])
    @record_new.third_type = tide_data[2]["type"]
    @record_new.third_time = format_time(tide_data[2]["time"])
    @record_new.third_height = m_to_ft(tide_data[2]["height"])

    if tide_data[3]
      @record_new.fourth_type = tide_data[3]["type"]
      @record_new.fourth_time = format_time(tide_data[3]["time"])
      @record_new.fourth_height = m_to_ft(tide_data[3]["height"])
    else
      @record_new.fourth_type = "NA"
      @record_new.fourth_time = "NA"
      @record_new.fourth_height = "NA"
    end
  end
    ################Future PORO################
  def create_astro(stormglass_client, parsed_time)
    # astro_request = "astronomicalDawn,astronomicalDusk,civilDawn,civilDusk,moonFraction,moonPhase,moonrise,moonset,sunrise,sunset,time"
    # astro_url="astronomy/point?lat=#{@record_new.latitude}&lng=#{@record_new.longitude}&start=#{start_time}&end=#{end_DateTime_day}&params=#{astro_request}"

    astro_url = stormglass_client.create_url("astro", parsed_time, @record_new.latitude, @record_new.longitude)
    parsed_response = stormglass_client.faraday_request(astro_url)

    response_successfull?(parsed_response)
    astro_data = parsed_response["data"]
    @record_new.astronomicalDawn = format_time(astro_data[0]["astronomicalDawn"])
    @record_new.astronomicalDusk = format_time(astro_data[0]["astronomicalDusk"])
    @record_new.civilDawn = format_time(astro_data[0]["civilDawn"])
    @record_new.civilDusk = format_time(astro_data[0]["civilDusk"])
    @record_new.moonFraction = (astro_data[0]["moonFraction"]).round(2).to_s
    @record_new.moonPhase = astro_data[0]["moonPhase"]["closest"]["text"].to_s
    @record_new.moonrise = (astro_data[0]["moonrise"]==nil ? "NA" : format_time(astro_data[0]["moonrise"]))
    @record_new.moonset = (astro_data[0]["moonset"]==nil ? "NA" : format_time(astro_data[0]["moonset"]))
    @record_new.sunrise = format_time(astro_data[0]["sunrise"])
    @record_new.sunset = format_time(astro_data[0]["sunset"])
    @record_new.astro_time = format_time(astro_data[0]["time"])

  end
    ################Future PORO################
  def create_waves(stormglass_client, parsed_time)
    # wave_request = 'seaLevel,swellDirection,swellHeight,swellPeriod,secondarySwellDirection,secondarySwellHeight,secondarySwellPeriod,waveDirection,waveHeight,wavePeriod,windWaveDirection,windWaveHeight,windWavePeriod'

    # wave_url = "weather/point?lat=#{@record_new.latitude}&lng=#{@record_new.longitude}&start=#{start_date}&end=#{end_DateTime_day}&params=#{wave_request}"

    wave_url = stormglass_client.create_url("wave", parsed_time, @record_new.latitude, @record_new.longitude)
    parsed_response = stormglass_client.faraday_request(wave_url)

    response_successfull?(parsed_response)
    data = parsed_response["hours"][0]
    data.include?("seaLevel") ? @record_new.seaLevel=m_to_ft(data["seaLevel"]["sg"]) : @record_new.seaLevel=0
    @record_new.swellDirection=data["swellDirection"]["sg"].to_s
    @record_new.swellHeight=m_to_ft(data["swellHeight"]["sg"])
    @record_new.swellPeriod=data["swellPeriod"]["sg"].to_s
    @record_new.secondarySwellDirection=data.include?("secondarySwellPeriod") ? data["secondarySwellDirection"]["sg"].to_s : "NA"
    @record_new.secondarySwellHeight= data.include?("secondarySwellHeight") ? m_to_ft(data["secondarySwellHeight"]["sg"]) : "NA"
    @record_new.secondarySwellPeriod= data.include?("secondarySwellHeight") ? data["secondarySwellPeriod"]["sg"].to_s : "NA"
    @record_new.waveDirection=data["waveDirection"]["sg"].to_s
    @record_new.waveHeight=m_to_ft(data["waveHeight"]["sg"])
    @record_new.wavePeriod=data["wavePeriod"]["sg"].to_s
    @record_new.windWaveDirection=data["windWaveDirection"]["sg"].to_s
    @record_new.windWaveHeight=m_to_ft(data["windWaveHeight"]["sg"])
    @record_new.windWavePeriod=m_to_ft(data["windWavePeriod"]["sg"])
  end

  def m_to_ft(number)
    return (number*3.28).round(2).to_s
  end

  def format_time(time)
    return (DateTime.strptime(time, "%Y-%m-%dT%H:%M:%S%z").localtime).strftime("%m-%d-%Y %H:%M")
  end

  def mps_to_mph(speed)
    return (speed*2.237).round(2).to_s
  end

  private

  def create_params
    params.require(:record).permit(:name, :success, :body, :latitude, :longitude, :datetime)
  end

  def update_params
    params.require(:record).permit(:name, :success, :body)
  end

  def response_successfull?(parsed_response)
    return parsed_response if parsed_response.exclude?("error")
    begin
      error_message = "Errors: #{parsed_response['errors']}, Response: #{parsed_response}"
      raise StandardError.new "#{parsed_response}"
    rescue 
      redirect_to root_path, flash: {error: error_message}            
    end
  end
end