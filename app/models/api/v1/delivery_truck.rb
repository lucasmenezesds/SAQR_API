class Api::V1::DeliveryTruck < ApplicationRecord
  belongs_to :truck
  belongs_to :delivery
end