class Api::V1::Delivery < ApplicationRecord
  has_many :delivery_trucks
  belongs_to :picking_time
  belongs_to :load_time
  belongs_to :transportation_time
  belongs_to :receive_time
  belongs_to :storage_time
end