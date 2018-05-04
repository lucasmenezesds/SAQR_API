class TruckSerializer < ActiveModel::Serializer
  attributes :id, :model

  belongs_to :driver
  has_many :cargos
end
