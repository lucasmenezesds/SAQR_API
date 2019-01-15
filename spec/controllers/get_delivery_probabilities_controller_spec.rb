require 'rails_helper'

RSpec.describe GetDeliveryProbabilitiesController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # GetDeliveryProbability. As you add validations to GetDeliveryProbability, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # GetDeliveryProbabilitiesController. Be sure to keep this updated too.
  let(:valid_session) { { headers: { ACCEPT: 'application/vnd.api+json' } } }

  describe 'GET #index' do
    let(:headers_obj) { { ACCEPT: 'application/vnd.api+json' } }
    let(:parameters) { { origin_city: 123, destination_city: 321 } }

    before(:each) do
      request.headers.merge! headers_obj
      allow(Delivery)
        .to receive(:get_duration_times)
              .and_return([1, 2, 3, 4])
    end

    it 'should return a success response' do
      get :index, params: parameters, session: valid_session
      expect(response).to be_success
    end

    it 'should return an error if the required params are missing' do
      expect {
        get :index, params: {}, session: valid_session
      }.to raise_error(message = 'param is missing or the value is empty: origin_city')
    end

    it 'should return an hash' do
      get :index, params: parameters, session: valid_session
      expect(response.body).to eql('{}')
    end
  end
end
