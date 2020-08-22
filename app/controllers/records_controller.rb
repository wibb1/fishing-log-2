class RecordsController < ApplicationController
require 'date'

  def new
    @record_new = Record.new()
    @record_new.user = current_user
  end

  def create
    time = Time.zone.local(create_params["datetime(1i)"], create_params["datetime(2i)"], create_params["datetime(3i)"], create_params["datetime(4i)"], create_params["datetime(5i)"])

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

  private

  def create_params
    params.require(:record).permit(:name, :success, :body, :latitude, :longitude, :datetime)
  end
end