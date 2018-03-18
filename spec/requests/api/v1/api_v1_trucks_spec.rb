require 'rails_helper'

RSpec.describe "Api::V1::Trucks", type: :request do
  describe "GET /api_v1_trucks" do
    it "works! (now write some real specs)" do
      get api_v1_trucks_path
      expect(response).to have_http_status(200)
    end
  end
end
