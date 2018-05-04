class LoadTimeSerializer < ActiveModel::Serializer
  attributes :id, :duration_time, :start_time, :event, :load_date

  has_one :delivery
end
