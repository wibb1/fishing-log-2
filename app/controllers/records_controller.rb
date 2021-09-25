class RecordsController < ApplicationController
  require 'date'
  require './lib/apis/get_api_data.rb'

  before_action :authenticate_user!
  before_action :set_species, only: [:new, :update, :create, :edit]

  def new
    @record_new = Record.new
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
    time =
      Time.local(
        create_params['datetime(1i)'],
        create_params['datetime(2i)'],
        create_params['datetime(3i)'],
        create_params['datetime(4i)'],
        create_params['datetime(5i)'],
      )
    @record_new = Record.new(create_params)
    @record_new.latitude *= -1 if create_params['latitude_direction']=="S"
    @record_new.longitude *= -1 if create_params['longitude_direction']=="W"
    @record_new.datetime = time
    @record_new.date = time.strftime('%Y-%m-%dT%H:%M:%S%z')
    @record_new.time = time.strftime('%H:%M')
    @record_new.js_date = time.to_f * 1000
    @record_new.user = current_user

    parsed_time = Time.parse(@record_new.date)

    response =
      Apis::StormglassApi::V2::GetApiData.new(
        parsed_time,
        @record_new.latitude,
        @record_new.longitude,
      )
    hash = response.get_api_data
    if hash.dig('weather', 'errors') || hash.dig('astro', 'errors') || hash.dig('tide', 'errors')
      api_errors_array = %w[weather astro tide].map { |i| "#{i.capitalize} request had an error: #{hash[i]['errors']}" }
      api_errors = api_errors_array.to_sentence
      flash[:errors] = api_errors
      puts "-----#{api_errors}-----"
      render 'new'
    else

      @record_new.assign_attributes(hash) 
      if @record_new.save
        flash[:notice] = 'Record successfully saved'
        redirect_to "/records/react/#{@record_new.id}"
      else
        flash[:errors] = @record_new.errors.full_messages.to_sentence
        puts "-----#{@record_new.errors.full_messages.to_sentence}-----"
        render 'new'
      end
    end
  end

  private

  def create_params
    params
      .require(:record)
      .permit(:name, :success, :body, :latitude, :latitude_direction, :longitude, :longitude_direction, :datetime, :species_id)
  end

  def update_params
    params.require(:record).permit(:name, :success, :body, :species_id)
  end

  def set_species
    @species_all = Species.all.sort_by(&:common_name)
  end
end
