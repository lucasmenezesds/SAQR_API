# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DeliveryProbabilitiesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/delivery_probabilities').to route_to('delivery_probabilities#index')
    end
  end
end
