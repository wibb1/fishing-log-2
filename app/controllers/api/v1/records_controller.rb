class Api::V1::RecordsController < ApiController
  require 'date'
  require './lib/apis/get_api_data.rb'

  before_action :authenticate_user!
  before_action :set_species, only: %i[update create]
  before_action :set_successes, only: %i[update create]

  def index
    records = current_user.records
    render json: {
             records: serialized_data(records, RecordSerializer, current_user),
           }
  end

  def show
    render json: Record.find(params[:id]), serializer: RecordShowSerializer
  end

  def create
    if current_user.nil?
      render json: { notice: 'Please login before submitting a record.' }
    else
      new_params = create_params
      new_params['success'] =
        Record.successes[create_params['success'].downcase]
      
      @record_new = Record.new(new_params)
      @record_new.latitude *= -1 if params['latitudDirection'] == 'S'
      @record_new.longitude *= -1 if params['longitudeDirection'] == 'W'
      @record_new.js_date = create_params['datetime'] 
      new_datetime = Time.at(@record_new.js_date/1000.0)
      @record_new.datetime = new_datetime
      @record_new.date = new_datetime.strftime('%Y-%m-%dT%H:%M:%S%z')
      @record_new.time = new_datetime.strftime('%H:%M')
      
      @record_new.user = current_user

      parsed_time = Time.parse(@record_new.date)

      response =
        Apis::StormglassApi::V2::GetApiData.new(
          parsed_time,
          @record_new.latitude,
          @record_new.longitude,
        )
      hash = response.get_api_data
      if hash.dig('weather', 'errors') || hash.dig('astro', 'errors') ||
           hash.dig('tide', 'errors')
        api_errors_array =
          %w[weather astro tide].map do |i|
            "#{i.capitalize} request had an error: #{hash[i]['errors']}"
          end
        api_errors = api_errors_array.to_sentence
        flash[:errors] = api_errors
        puts "-----#{api_errors}-----"
        render '/records/react/create'
      else
        @record_new.assign_attributes(hash)
        if @record_new.save
          puts '-----Record successfully saved-----'
          render json: { record: @record }, status: 200
        else
          render json: {
                   message: @record_new.errors.full_messages.to_sentence,
                 },
                 status: 500
          puts "-----#{@record_new.errors.full_messages.to_sentence}-----"
          render '/records/react/create'
        end
      end
    end
  end


  def update
    # needs to be updated for React
    record = Record.find(params[:id])
    if record.update(update_params)
      redirect_to "/records/react/#{@record.id}"
    else
      render "/records/react/#{@record.id}/edit"
    end
  end

  private

  def serialized_data(data, serializer, scope)
    ActiveModelSerializers::SerializableResource.new(
      data,
      each_serializer: serializer,
      scope: current_user,
    )
  end

  def create_params
    params
      .require(:record)
      .permit(
        :name,
        :latitude,
        :longitude,
        :datetime,
        :species_id,
        :success,
        :body,
      )
  end

  def update_params
    params.require(:record).permit(:name, :success, :body, :species_id)
  end

  def set_successes
    successes = Record.successes
  end

  def set_species
    species =
      Species.all.sort_by(&:common_name).map { |object| object.common_name }
  end
end
