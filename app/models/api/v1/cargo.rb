class Api::V1::Cargo < ApplicationRecord
  belongs_to :api_v1_truck, :class_name => 'Api::V1::Truck'
  belongs_to :api_v1_delivery, :class_name => 'Api::V1::Delivery'
end