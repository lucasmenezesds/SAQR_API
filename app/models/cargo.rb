class Cargo < ApplicationRecord
  belongs_to :truck
  belongs_to :delivery
end
