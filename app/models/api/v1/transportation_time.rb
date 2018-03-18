class Api::V1::TransportationTime < ApplicationRecord
  has_one :api_v1_delivery, :class_name => 'Api::V1::Delivery'
  belongs_to :origin_city, :class_name => 'Api::V1::City'
  belongs_to :destination_city, :class_name => 'Api::V1::City'
end
