class TransportationTimeSerializer < ActiveModel::Serializer
  attributes :id, :duration_time, :event, :transportation_date, :origin_city, :destination_city
end
