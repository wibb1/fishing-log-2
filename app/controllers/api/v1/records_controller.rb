class Api::V1::RecordsController < ApiController
  def index
    records = current_user.records
    render json: { records: serialized_data( records, RecordSerializer, current_user) }
  end

  private

  def serialized_data(data, serializer, scope)
    ActiveModelSerializers::SerializableResource.new(data, each_serializer: serializer, scope: current_user)
  end
end