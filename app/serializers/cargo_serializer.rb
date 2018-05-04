class CargoSerializer < ActiveModel::Serializer
  attributes :id

  belongs_to :truck
  belongs_to :delivery
end
