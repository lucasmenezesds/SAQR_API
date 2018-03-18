require 'rails_helper'

RSpec.describe "Api::V1::StorageTimes", type: :request do
  describe "GET /api_v1_storage_times" do
    it "works! (now write some real specs)" do
      get api_v1_storage_times_path
      expect(response).to have_http_status(200)
    end
  end
end
