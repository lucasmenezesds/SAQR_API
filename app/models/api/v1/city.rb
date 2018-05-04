class Api::V1::City < ApplicationRecord
  has_many :transportation_times
end