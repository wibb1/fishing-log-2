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
    # needs to be updated for React
    render json: { species: set_species, successes: set_successes }
    binding.pry
    if current_user.nil?
      render json: { notice: 'Please login before submitting a record.' }
    else
      record = Record.new(create_params)
    end
  end

  def update
    # needs to be updated for React
    record = Record.find(params[:id])
    if record.update(update_params)
      redirect_to "/records/react/#{@record.id}"
    else
      render 'edit'
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
        :latitudeDirection,
        :longitude,
        :longitudeDirection,
        :datetime,
        :species,
        :success,
        :body,
        :ApiController,
        :action,
        :record,
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
