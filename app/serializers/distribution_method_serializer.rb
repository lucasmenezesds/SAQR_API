# frozen_string_literal: true

# JSON Serializer
class DistributionMethodSerializer < ActiveModel::Serializer
  attribute :id, key: :key
  attribute :short_name, key: :value
  attribute :name, key: :text
end
