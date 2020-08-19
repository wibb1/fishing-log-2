class RecordSerializer < ActiveModel::Serializer
  attributes :id, :name, :success, :user_id
end

