# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'GetDeliveryProbabilities', type: :request do
  describe 'GET /get_delivery_probabilities' do
    context 'when I send the get request with accept header' do
      it 'should return 200' do
        get get_delivery_probabilities_path, params: { origin_city: 1, destination_city: 2 },
                                             headers: { ACCEPT: 'application/vnd.api+json' }
        expect(response).to have_http_status(200)
      end
    end
  end
end
