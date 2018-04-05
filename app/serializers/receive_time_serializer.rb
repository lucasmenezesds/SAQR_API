class ReceiveTimeSerializer < ActiveModel::Serializer
  attributes :id, :duration_time, :event, :received_date
end
