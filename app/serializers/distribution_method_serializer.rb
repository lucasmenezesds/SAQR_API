# frozen_string_literal: true

# JSON Serializer
class DistributionMethodSerializer < ActiveModel::Serializer
  attributes :id, :name, :short_name
end
