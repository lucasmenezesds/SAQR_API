# frozen_string_literal: true

# JSON Serializer
class SimulateDeliverySerializer < ActiveModel::Serializer
  attributes :steps,
             :delivery_step,
             :distribution_method,
             :name,
             :parameters

end
