class StorageTimeSerializer < ActiveModel::Serializer
  attributes :id, :duration_time, :start_time, :event, :storage_date

  has_one :delivery
end
