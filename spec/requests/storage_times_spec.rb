require 'rails_helper'

RSpec.describe "StorageTimes", type: :request do
  describe "GET /storage_times" do
    it "works! (now write some real specs)" do
      get storage_times_path
      expect(response).to have_http_status(200)
    end
  end
end
