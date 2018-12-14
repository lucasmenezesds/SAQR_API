require 'rails_helper'

RSpec.describe GetDeliveryProbabilitiesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/get_delivery_probabilities').to route_to('get_delivery_probabilities#index')
    end
  end
end
