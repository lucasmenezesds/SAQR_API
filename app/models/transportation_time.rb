class TransportationTime < ApplicationRecord
  has_one :delivery
  belongs_to :origin_city, class_name: 'City', foreign_key: 'origin_city_id'
  belongs_to :destination_city, class_name: 'City', foreign_key: 'destination_city_id'
end
