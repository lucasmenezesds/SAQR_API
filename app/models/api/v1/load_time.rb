class Api::V1::LoadTime < ApplicationRecord
  has_one :api_v1_delivery, :class_name => 'Api::V1::Delivery'
end