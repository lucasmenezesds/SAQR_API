require 'rails_helper'

RSpec.describe "PickingTimes", type: :request do
  describe "GET /picking_times" do
    it "works! (now write some real specs)" do
      get picking_times_path
      expect(response).to have_http_status(200)
    end
  end
end
