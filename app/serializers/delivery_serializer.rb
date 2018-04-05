class DeliverySerializer < ActiveModel::Serializer
  attributes :id, :picking_time, :load_time, :transportation_time, :receive_time, :storage_time, :delivery_date
end
