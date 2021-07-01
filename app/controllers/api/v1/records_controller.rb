class Api::V1::RecordsController < ApiController
  def index
    records = current_user.records
    render json: { records: serialized_data( records, RecordSerializer, current_user) }
  end

  def show
    render json: Record.find(params[:id]), serializer: RecordShowSerializer
  end

  def create
  end

  def update
    record = Record.find(params[:id])
    if record.update(update_params)
      redirect_to "/records/react/#{@record.id}"
    else
      render 'edit'
    end
  end

  private

  def serialized_data(data, serializer, scope)
    ActiveModelSerializers::SerializableResource.new(data, each_serializer: serializer, scope: current_user)
  end
  
  def update_params
    params.require(:record).permit(:name, :success, :body, :species_id)
  end
end

