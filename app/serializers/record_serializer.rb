class RecordSerializer < ActiveModel::Serializer
  attributes :id, :name, :success, :user_id, :body, :time, :date, :latitude, :longitude
end

